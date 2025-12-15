FROM archlinux:latest

# Update system and install AUR build dependencies
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm --needed base-devel git sudo namcap && \
    pacman -Scc --noconfirm

# Create non-root user for makepkg (it refuses to run as root)
RUN useradd -m builder && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set up working directory
WORKDIR /pkg

# Switch to builder user
USER builder

CMD ["bash"]
