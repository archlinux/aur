FROM archlinux/base

RUN pacman -Syu --noconfirm base-devel git ruby ruby-rb-inotify
RUN useradd build
RUN mkdir /src

WORKDIR /src
RUN git clone https://aur.archlinux.org/ruby-open_uri_redirections.git
WORKDIR ruby-open_uri_redirections
RUN chmod 777 .

USER build
RUN makepkg

USER root
RUN pacman -U --noconfirm ruby-open_uri_redirections-*.pkg.tar.xz

USER build
WORKDIR /src/transmission-rss

CMD \
  makepkg -f && \
  makepkg -f --printsrcinfo > .SRCINFO
