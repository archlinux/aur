FROM archlinux:latest AS build-stage

RUN echo $'\
Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch\n\
Server = https://mirrors.cloud.tencent.com/archlinux/$repo/os/$arch\n\
' > /etc/pacman.d/mirrorlist

RUN echo $'\
[archlinuxcn]\n\
Server = https://mirrors.aliyun.com/archlinuxcn/$arch\n\
Server = https://mirrors.cloud.tencent.com/archlinuxcn/$arch\n\
' >> /etc/pacman.conf

RUN pacman-key --init
RUN pacman -Syu archlinuxcn-keyring base-devel pacman-contrib namcap --needed --noconfirm
RUN pacman -S yay --needed --noconfirm

RUN echo 'nobody ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN usermod -d /tmp nobody

USER nobody
COPY --chown=nobody:nobody PKGBUILD xorgxrdp-nvidia-git.install /code/
WORKDIR /code

ENV ALL_PROXY=socks5h://host.docker.internal:1080
RUN updpkgsums
RUN makepkg --printsrcinfo > .SRCINFO
RUN yay -S xrdp-git --needed --noconfirm
RUN makepkg -si --needed --noconfirm

RUN pacman -Ql xorgxrdp-nvidia-git
RUN namcap PKGBUILD
RUN [ -z "$(namcap PKGBUILD 2>&1)" ]

FROM scratch AS export-stage
COPY --from=build-stage /code/PKGBUILD /code/.SRCINFO /
