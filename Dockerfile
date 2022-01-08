FROM docker.io/library/archlinux:base

RUN pacman -Sy --noconfirm binutils fakeroot gcc git go namcap

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/pkguser && \
    echo "pkguser:x:${uid}:${gid}:Pkguser,,,:/home/pkguser:/bin/bash" >> /etc/passwd && \
    echo "pkguser:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/pkguser

USER pkguser

ENV HOME /home/pkguser

WORKDIR /home/pkguser

COPY . .

CMD makepkg && pacman -Qip *.pkg.tar.zst && pacman -Qlp *.pkg.tar.zst && namcap PKGBUILD && namcap *.pkg.tar.zst
