# Specify target platform architecture
# Use linux/amd64 for x86_64 systems, linux/arm64 for ARM64 systems
# Uncomment the appropriate line for your target architecture:
# FROM --platform=linux/amd64 brianrobt/archlinux-aur-dev:latest
FROM --platform=linux/arm64 brianrobt/archlinux-aur-dev:latest

RUN sudo pacman -Syu --noconfirm

# Copy local AUR package files to the container
COPY --chown=builder:builder .SRCINFO PKGBUILD ./

# Install build dependencies
RUN yay -S --noconfirm \
  rust \
  cargo

# Build the package
RUN makepkg -sif --noconfirm