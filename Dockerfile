# Docker image that tests if the package builds in a minimal archlinux environemnt

FROM archlinux

# Preparation
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm --needed base-devel

# Configuration
ARG DOCKER_USER=buildbot
ARG DOCKER_PROJECT=python-timebudget-git

# Creating new user
RUN useradd --base-dir /home -m --shell /bin/sh --gid root --comment "Build Bot,$HOSTNAME,,," "$DOCKER_USER"
RUN echo "$DOCKER_USER ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$DOCKER_USER"

USER $DOCKER_USER

# Actual build
ARG DOCKER_WORKDIR=/home/$DOCKER_USER/$DOCKER_PROJECT
COPY --chown="$DOCKER_USER:root" PKGBUILD "$DOCKER_WORKDIR/"
WORKDIR $DOCKER_WORKDIR
RUN makepkg --syncdeps --rmdeps --install --noconfirm --needed --clean
RUN pacman -Ql "$DOCKER_PROJECT"
RUN pacman -Qi "$DOCKER_PROJECT"
