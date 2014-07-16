FROM nubs/arch-build

MAINTAINER Spencer Rinehart <anubis@overthemonkey.com>

USER root

RUN bash -c 'echo -e "[oracle]\nSigLevel = Optional TrustAll\nServer = http://linux.shikadi.net/arch/\$repo/\$arch/" >>/etc/pacman.conf'

RUN pacman --sync --refresh --noconfirm --noprogressbar --quiet
RUN pacman --sync --noconfirm --noprogressbar --quiet php oracle-instantclient-sdk

USER build
