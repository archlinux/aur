#% Docker image that tests if the package builds in a minimal archlinux environemnt

FROM archlinux

ARG PROJECT=python-asn1tools
ARG BOT=buildbot
ARG NAME='Build Bot'
ARG GROUP=root
ARG PREFIX=/

RUN pacman-key --init
RUN pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
RUN pacman-key --lsign-key 3056513887B78AEB

RUN pacman -U --noconfirm https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst
RUN echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n" | tee -a /etc/pacman.conf
RUN pacman -Syu --noconfirm chaotic-keyring base-devel
RUN pacman -S --noconfirm yay

# Creating build user
RUN useradd --base-dir="$PREFIX" --create-home --shell=/bin/sh --gid="$GROUP" --comment="$NAME,$HOSTNAME,,," "$BOT"
RUN echo "$BOT ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$BOT"

WORKDIR $PREFIX/$BOT
COPY --chown=$BOT:$GROUP 00-handle-odd-numbered-hex-strings.patch PKGBUILD .SRCINFO .
COPY --chown=$BOT:$GROUP .git .git

USER $BOT
RUN yay --answerclean None --answerdiff None --noremovemake --noconfirm --mflags '--nocheck' -Bi .
ENTRYPOINT ["/bin/bash"]
