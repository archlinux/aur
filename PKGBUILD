# Maintainer: Yardena Cohen <yardenack at gmail dot com>

_pkgname=htop
pkgname=${_pkgname}-vim-git
pkgver=538.c33d32e
pkgrel=1
pkgdesc="Interactive text-mode process viewer. Patched for vim keybindings"
url="https://github.com/hishamhm/${_pkgname}"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('git' 'python2')
optdepends=('lsof: list open files for running process'
            'strace: attach to running process')
provides=('htop')
conflicts=('htop' 'htop-git')
options=('!emptydirs')
source=("git+${url}.git"
        '0001-Change-navigation-bindings-to-vi-standards.patch'
        '0002-Detail-changes-in-README.patch'
        '0003-Bind-o-to-expand-collapse.patch')
sha256sums=('SKIP'
            '6721c4975ed07bf4e7f64fefa2d9fe1c0a597e95a71ebc4f84e3064382525e0e'
            '14657468183b7f53a8076490cdd4bbc1c2cd8bbff0ab4148f2858ee8a2d4b61e'
            '603f7eacfa05f773f512e0a18625aac0b5cbaf5948fcb50aa45392a4f5584e80')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    for _p in ${srcdir}/*.patch
    do
        msg2 "Applying $_p"
        patch -p1 -i $_p
    done

    ./autogen.sh

    sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure
    sed -i 's|python|python2|' scripts/MakeHeader.py

    ./configure \
        --prefix=/usr \
        --enable-unicode \
        --enable-openvz \
        --enable-vserver \
        --enable-cgroup \
        --enable-oom
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
