# Docker image that tests if the package builds in a minimal archlinux environemnt

FROM archlinux

# Preparation
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm --needed base-devel git

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
RUN sudo pacman -S --asdeps --need --noconfirm python-pytest-asyncio python-pytest-trio python-curio
RUN sudo pacman -S --needed --noconfirm python-pip
RUN sudo aura -Aax --noconfirm pyocd
RUN sudo aura -Aax --noconfirm python2-prettytable
RUN sudo aura -Aax --noconfirm python2-fasteners
RUN sudo aura -Aax --noconfirm python2-junit-xml
RUN git clone https://aur.archlinux.org/python-mbed-ls.git
RUN cd python-mbed-ls && makepkg -sric --noconfirm --needed --asdeps
RUN git clone https://aur.archlinux.org/python-mbed-host-tests.git
RUN cd python-mbed-host-tests &&\
    yes | makepkg -src --needed --asdeps --nodeps &&\
    sudo pacman -Udd --noconfirm python-*.zst
RUN sudo aura -Aax --noconfirm --nocheck "$PROJECT"

RUN pacman -Ql "$PROJECT"
RUN pacman -Qi "$PROJECT"
