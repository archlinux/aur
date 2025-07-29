HEALTHCHECK true
FROM archlinux:1:28.3.2-1
COPY . /src

# Install necessary packages
RUN pacman -Sy --noconfirm base-devel git debugedit fakeroot binutils sudo

# Create user builder with home directory
RUN useradd -m -s /bin/bash builder

# Set root password to "abc"
# trunk-ignore(checkov)
RUN echo "root:abc" | chpasswd

# Set ownership of /src (create if doesn't exist)
RUN mkdir -p /src \
    && chown -R builder:builder /src

RUN chmod 777 /src

# Create /home/builder and set ownership
RUN mkdir -p /home/builder \
    && chown builder:builder /home/builder

# Remove nimra* files from /src if any exist
RUN find /src -maxdepth 1 -name 'nimra*' ! -name 'nimra' -exec rm -rf {} +


# Run makepkg as builder in /src via su
RUN su - builder -c "cd /src && makepkg -si -S abc"
USER builder