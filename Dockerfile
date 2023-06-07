FROM docker.io/library/archlinux

RUN pacman -Sy --noconfirm base-devel git && \
    useradd builduser -m && \
    passwd -d builduser && \
    mkdir -p /home/builduser/target
COPY . /home/builduser/target
RUN chown builduser -R /home/builduser/target
WORKDIR /home/builduser/target
USER builduser
CMD ["make", "build"]
