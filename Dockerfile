# Build this with `docker build -t arch .`
# Then run it with
# docker run -it --rm --mount type=bind,source=$(pwd),target=/tmp/ddev-bin --workdir=/tmp/ddev-bin arch
# makepkg --printsrcinfo > .SRCINFO
# makepkg -s
FROM archlinux:latest
RUN echo | pacman -Sy sudo binutils fakeroot docker docker-compose
RUN useradd builder
CMD bash -c "su builder"
