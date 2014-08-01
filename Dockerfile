FROM nubs/arch-build

MAINTAINER Spencer Rinehart <anubis@overthemonkey.com>

USER root

RUN pacman --sync --refresh --noconfirm --noprogressbar --quiet
RUN pacman --sync --noconfirm --noprogressbar --quiet php

USER build
