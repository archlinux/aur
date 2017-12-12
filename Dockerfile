FROM base/devel:latest

RUN pacman -Syu --noconfirm

ENV APP=/firegrid-arch

COPY . $APP

RUN useradd dev && \
    echo "dev ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dev && \
    chown -R dev:dev $APP

USER dev

WORKDIR $APP
