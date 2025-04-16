FROM archlinux

RUN pacman -Sy --noconfirm git just && \
	pacman -Scc --noconfirm && \
	rm -rf /var/lib/pacman/*
