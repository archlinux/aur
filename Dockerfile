FROM archlinux/base

RUN pacman -Syu --noconfirm base-devel git ruby
RUN useradd build

USER build
WORKDIR /src

CMD \
  makepkg -f && \
  makepkg -f --printsrcinfo > .SRCINFO
