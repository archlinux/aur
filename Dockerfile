FROM archlinux:latest

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN groupadd -g ${GROUP_ID} build && useradd -m -u ${USER_ID} -g build build
WORKDIR /home/build
# RUN pacman -Sy --noconfirm fakeroot binutils go make git upx
RUN pacman -Sy --noconfirm fakeroot binutils go make
USER build
WORKDIR src
CMD \
    makepkg --printsrcinfo > .SRCINFO && \
    makepkg -f && \
    rm -rf src pkg protonutils-*.tar.gz
