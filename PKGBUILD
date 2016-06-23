# Maintainer: Yardena Cohen <yardenack at gmail dot com>

_pkgname=htop
pkgname=${_pkgname}-vim-git
pkgver=899.7f9c82f
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
        'vim-keybindings.patch')
sha256sums=('SKIP'
            '76073636b87f43cece2072a7c9944768535c147f1b36843345ebba91073adfec')

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
