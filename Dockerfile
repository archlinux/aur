FROM archlinux

# WORKAROUND for glibc 2.33 and old Docker
# See https://github.com/actions/virtual-environments/issues/2658
# Thanks to https://github.com/lxqt/lxqt-panel/pull/1562
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
    bsdtar -C / -xvf "$patched_glibc"

RUN pacman --noconfirm -Syu archlinux-keyring
RUN pacman --noconfirm -Syu autoconf base-devel boost capstone clang cmake curl \
        doxygen gcc gcc-libs git graphviz jdk8-openjdk libtool make protobuf \
        python python-networkx python-pip wget
RUN python3 -m pip install pre-commit wheel

# Common-Lisp specific setup.
RUN sed -i "s/^\(OPT_LONG=(\)/\1'asroot' /;s/EUID == 0/1 == 0/" /usr/bin/makepkg
RUN git clone --depth 1 https://aur.archlinux.org/yay.git /yay-aur
RUN sed -i "s|^  cd \"\$srcdir/\$pkgname-\$pkgver\"|&\\n  sed -i 's/os.Geteuid()/1/' main.go install.go|" /yay-aur/PKGBUILD
RUN sed -i "s/package() {/package() {\n  unset LDFLAGS/" /yay-aur/PKGBUILD
RUN cd /yay-aur && makepkg --noconfirm -si

COPY . /gtirb-aur
# RUN yay --noconfirm -Sy ddisasm-git
