FROM docker.io/archlinux

# development container to build and run dracut-git tests

# install paru
RUN pacman --noconfirm -Syu base-devel git pacman-contrib
RUN useradd -m build && echo "build ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> "/etc/sudoers.d/allow_pacman" && echo "build ALL=(ALL) NOPASSWD: /usr/bin/paru" >> "/etc/sudoers.d/allow_pacman"
RUN su build -c 'cd && git clone https://aur.archlinux.org/paru-bin.git && cd paru-bin && makepkg -s --noconfirm' && pacman -U --noconfirm ~build/paru-bin/*.pkg.tar.*

# extra test dependencies
RUN su build -c 'paru --needed --noconfirm -Syu perl-config-general tgt'

# install dracut-git without running tests
RUN su build -c 'paru --nocheck --needed --noconfirm -Syu dracut-git'

# install all optional dependencies
RUN L=$(paru -Si dracut-git | sed -n '/^Opt/,/^Conf/p' | sed '$d' | sed 's/^Opt.*://g' | sed 's/^\s*//g' | tr '\n' ' ') && su build -c "paru --needed --noconfirm -Syu $L"

# reinstall with running tests
RUN su build -c 'V=1 paru --rebuild -S dracut-git'

RUN rm -fr ~build
