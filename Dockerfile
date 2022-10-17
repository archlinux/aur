FROM archlinux:base-devel

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN groupadd -g ${GROUP_ID} build && useradd -m -u ${USER_ID} -g build build
WORKDIR /home/build
RUN pacman -Sy --noconfirm go git
USER build
WORKDIR /home/build/src
CMD \
    makepkg -f && \
    makepkg --printsrcinfo > .SRCINFO && \
    rm -rf src pkg protonutils-*.tar.gz