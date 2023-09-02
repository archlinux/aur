FROM archlinux

# Install dependencies
RUN pacman --noconfirm -Sy fakeroot

# Set up user
RUN useradd -m builder
COPY PKGBUILD /home/builder
WORKDIR /home/builder

# Build package
USER builder
RUN makepkg --printsrcinfo >.SRCINFO
RUN makepkg

# Install package
USER root
RUN pacman --noconfirm -U patat-bin-*

# Test executable
USER builder
RUN patat --version

# Produce new .SRCINFO
CMD cat .SRCINFO
