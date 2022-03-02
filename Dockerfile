# NOTE: This AUR repository includes a couple of support tools that
# make it easier for the maintainer to keep the PKGBUILD up to date.
# Nothing aside from the PKGBUILD is actually run or installed when
# building the package.

FROM archlinux

RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -S base-devel git jq wget
RUN groupadd sudo
RUN echo '%sudo	ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/docker
