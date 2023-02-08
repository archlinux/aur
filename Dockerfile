FROM archlinux

RUN pacman -Sy --noconfirm base-devel git

ADD . /home/builduser

RUN useradd builduser -m \
  && passwd -d builduser \
  && echo -e 'builduser ALL=(ALL) NOPASSWD: ALL\n' >> /etc/sudoers \
  && chown -Rf builduser /home/builduser

WORKDIR /home/builduser
USER builduser

#RUN ["makepkg", "-si", "--noconfirm"]
