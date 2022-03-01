FROM docker.io/archlinux
RUN pacman -Sy
RUN pacman -S binutils --noconfirm
ADD . /app/src
RUN chown -R 1000:1000 /app/src
WORKDIR /app/src
USER 1000

ENTRYPOINT makepkg --printsrcinfo
