# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

_pkgname=htop
pkgname=${_pkgname}-vim-git
pkgver=1077.402e46b
pkgrel=1
pkgdesc="Interactive text-mode process viewer. Patched for vim keybindings"
url="https://github.com/hishamhm/${_pkgname}"
license=('GPL')
arch=('i686' 'x86_64' 'armv7h')
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
            'ab1df29dc5a73d8e723137ffc767d2592e6024b6a6ffeb13e7c967f04008a255')

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
        CFLAGS="-O2 -fno-common" \
        --prefix=/usr \
        --enable-unicode \
        --enable-openvz \
        --enable-vserver \
        --enable-cgroup
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
