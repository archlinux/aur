FROM archlinux:latest

# Update system and install base development tools
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
        base-devel \
        git \
        sbcl \
        curl \
        ncurses \
        sdl2 \
        gtk3 \
        webkit2gtk-4.1 \
        gcc \
        glibc \
        sudo

# Create a non-root build user (required by makepkg)
RUN useradd -m -G wheel builder && \
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Set up the build directory
RUN mkdir -p /build && \
    chown -R builder:builder /build

# Switch to the builder user
USER builder
WORKDIR /build

# Build will be triggered by docker run
ENTRYPOINT ["bash"]
