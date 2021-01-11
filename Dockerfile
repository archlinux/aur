FROM registry.hub.docker.com/library/archlinux:latest
RUN pacman -Sy zsh git rsync sudo fakeroot --noconfirm
RUN useradd -ms /usr/bin/zsh work && \
    usermod -aG wheel work
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir -p /home/work/ && touch /home/work/.zshrc
WORKDIR /home/work/
COPY zsh-zim-git-* /home/work
RUN chown -R work:work /home/work/
USER work
CMD /usr/bin/zsh
