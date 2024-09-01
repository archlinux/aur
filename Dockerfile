FROM archlinux

ARG UNAME=builder
ARG UID=1000
ARG GID=1000
RUN pacman -Sy --noconfirm base-devel pacman-contrib rust cargo-auditable scdoc
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME
CMD /bin/bash
