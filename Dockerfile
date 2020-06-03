# - Edit PKGBUILD to change the version and hash
# - Build this with `docker build -t arch .`
# - Then run it with
# docker run -it --rm --mount type=bind,source=$(pwd),target=/tmp/ddev-bin --workdir=/tmp/ddev-bin arch bash -c "makepkg --printsrcinfo > .SRCINFO && makepkg -s"
# Then `git add -u` and commit and push
FROM archlinux:latest
RUN echo | pacman -Sy sudo binutils fakeroot docker docker-compose
RUN useradd builder
USER builder
CMD bash
