FROM archlinux:latest

RUN pacman -Syu base-devel jdk-openjdk jdk11-openjdk --noconfirm
