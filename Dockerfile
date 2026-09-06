FROM archlinux:latest
WORKDIR /aur

RUN pacman -Sy --noconfirm jq ripgrep git curl

ENTRYPOINT ./update.sh
