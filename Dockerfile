FROM nubs/arch-build

MAINTAINER Spencer Rinehart <anubis@overthemonkey.com>

USER root

RUN pacman --sync --refresh --noconfirm --noprogressbar --quiet && pacman --sync --noconfirm --noprogressbar --quiet php gpgme

USER build
