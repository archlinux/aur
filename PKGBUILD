# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=wshowkeys-git
_pkgname=wshowkeys
pkgver=r2.a9bf6bc
pkgrel=1
pkgdesc='Displays keys being pressed on a Wayland session'
arch=('x86_64')
url='https://git.sr.ht/~sircmpwn/wshowkeys'
license=('GPL')
depends=('cairo' 'pango' 'libinput' 'libxkbcommon')
makedepends=('meson' 'wayland-protocols')
provides=('wshowkeys')
conflicts=('wshowkeys')
source=("$_pkgname::git+https://git.sr.ht/~sircmpwn/wshowkeys")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    mkdir build
    arch-meson build $_pkgname
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    chmod a+s $pkgdir/usr/bin/wshowkeys
}
