# Docker image that tests if the package builds in a minimal archlinux environemnt

FROM archlinux

# Preparation
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm --needed base-devel git python-pip

# Configuration
ARG PROJECT=python-pynng-git
ARG BOT=buildbot
ARG NAME='Build Bot'
ARG GROUP=root
ARG PREFIX=/

# Creating new user
RUN useradd --base-dir="$PREFIX" --create-home --shell=/bin/sh --gid="$GROUP" --comment="$NAME,$HOSTNAME,,," "$BOT"
RUN echo "$BOT ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$BOT"

# All following tasks should be perfromed by a new user
USER $BOT
WORKDIR $PREFIX/$BOT

# Compiling required AUR packages
RUN git clone https://aur.archlinux.org/aura-bin.git
RUN cd aura-bin && makepkg -sric --noconfirm --needed --asdeps
#RUN sudo aura -Aax --noconfirm python-prettytable
RUN sudo aura -Aax --noconfirm pyocd
RUN sudo aura -Aax --noconfirm python-cmsis-pack-manager
RUN sudo aura -Aax --noconfirm python-mbed-ls
RUN sudo aura -Aax --noconfirm python-mbed-host-tests

# Actual build
COPY --chown="$BOT:$GROUP" PKGBUILD "$PROJECT/"
WORKDIR $PROJECT
RUN makepkg -sric --noconfirm --needed
RUN pacman -Ql "$PROJECT"
RUN pacman -Qi "$PROJECT"
