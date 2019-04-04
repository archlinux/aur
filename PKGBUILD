# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=antares-git
pkgver=r198.g987787c
pkgrel=1
pkgdesc='A window manager for X'
arch=(x86_64)
url='https://notabug.org/Leon_Plickat/antares'
license=(GPL3)
depends=(cairo libxinerama)
makedepends=(git)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}.git"
	'Makefile.patch')
sha256sums=('SKIP'
            '1469f6c22656a25211e55715e84f67eb3fa072913fa97345319318a37831428a')

pkgver() {
    cd "${pkgname%-*}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-*}"
    patch -Np1 -i ../Makefile.patch

    if [ -e $startdir/config.h ]; then
        msg2 "using custom config.h"
        cp ${startdir}/config.h src/config.h
    else
        msg2 "using default config.h"
    fi

    if [ -e $startdir/keybind_functions.c ]; then
        msg2 "using custom keybind_functions.c"
	cp ${startdir}/keybind_functions.c src/keybind_functions.c
    else
        msg2 "using default keybind_functions.c"
    fi 
}

build() {
    make -C "${pkgname%-*}"
}

package() {
    make -C "${pkgname%-*}" PREFIX=/usr DESTDIR="$pkgdir/" install
}
