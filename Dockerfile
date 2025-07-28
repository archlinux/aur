FROM brianrobt/archlinux-aur-dev:latest

# Copy local AUR package files to the container
COPY --chown=builder:builder .SRCINFO PKGBUILD alist.* config.json ./

# Update the system
USER root
RUN pacman -Syu --noconfirm

# Install build dependencies
USER builder
RUN yay -S --noconfirm \
  glibc \
  go

# Build the package
RUN updpkgsums
RUN makepkg -sif --noconfirm
RUN makepkg --printsrcinfo > .SRCINFO
