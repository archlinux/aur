FROM archlinux/archlinux AS one-stage

RUN useradd -m archlinux \
	&& passwd -d archlinux \
	&& pacman -Syu --noconfirm \
	&& pacman -S --noconfirm bash-completion binutils debugedit fakeroot \
		gcc git jq make sudo \
	&& echo "archlinux ALL=(ALL) ALL" \
	| tee /etc/sudoers.d/archlinux

RUN git clone https://github.com/mvtab/aurx \
	&& cp ./aurx/aurx /usr/bin/aurx \
	&& aurx completion bash \
	| tee /usr/share/bash-completion/completions/aurx \
	&& rm -rf ./aurx

WORKDIR /home/archlinux
USER archlinux

ENV AURX_TMP_PATH="/home/archlinux/tmp"

CMD ["aurx","--help"]
