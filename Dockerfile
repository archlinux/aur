FROM archlinux
RUN pacman -Sy --noconfirm
RUN pacman -S --noconfirm base-devel
RUN pacman -S --noconfirm git
RUN pacman -S --noconfirm go
RUN useradd builder
RUN mkdir /home/builder && chown builder /home/builder
USER builder
WORKDIR /build
