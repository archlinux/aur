FROM brianrobt/archlinux-aur-dev:latest

# Copy local AUR package files to the container
COPY --chown=builder:builder .SRCINFO PKGBUILD pixieditor.sh *.desktop ./

USER root
RUN pacman -Syu --noconfirm

# Install all dependencies (including AUR ones) automatically
USER builder
RUN yay -S --noconfirm \
  libxcursor \
  fontconfig \
  gcc-libs \
  glibc \
  zlib

# Build the package
RUN updpkgsums
RUN makepkg -sif --noconfirm
RUN makepkg --printsrcinfo > .SRCINFO