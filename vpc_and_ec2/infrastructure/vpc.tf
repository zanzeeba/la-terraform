provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

resource "aws_vpc" "production-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags {
    name = "Production-VPC"
  }
}

resource "aws_subnet" "public-subnet-1" {
  cidr_block = "${var.public_subnet_1_cidr}"
  vpc_id = aws_vpc.production-vpc.id
  availability_zone = "eu_west-2a"

  tags {
    name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  cidr_block = "${var.public_subnet_2_cidr}"
  vpc_id = aws_vpc.production-vpc.id
  availability_zone = "eu_west-2b"

  tags {
    name = "Public-Subnet-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  cidr_block = "${var.public_subnet_3_cidr}"
  vpc_id = aws_vpc.production-vpc.id
  availability_zone = "eu_west-2c"

  tags {
    name = "Public-Subnet-3"
  }
}

resource "aws_subnet" "private-subnet-1" {
  cidr_block = "${var.private_subnet_1_cidr}"
  vpc_id = aws_vpc.production-vpc.id
  availability_zone = "eu_west-2a"

  tags {
    name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  cidr_block = "${var.private_subnet_2_cidr}"
  vpc_id = aws_vpc.production-vpc.id
  availability_zone = "eu_west-2b"

  tags {
    name = "Private-Subnet-2"
  }
}

resource "aws_subnet" "private-subnet-3" {
  cidr_block = "${var.private_subnet_32_cidr}"
  vpc_id = aws_vpc.production-vpc.id
  availability_zone = "eu_west-2c"

  tags {
    name = "Private-Subnet-3"
  }
}

resource "aws_route_table" "public-rout-table" {
  vpc_id = "${aws_vpc.production-vpc.id}"

  tags {
    name = "Public-Route-Table"
  }
}

resource "aws_route_table" "private-rout-table" {
  vpc_id = "${aws_vpc.production-vpc.id}"

  tags {
    name = "Private-Route-Table"
  }
}