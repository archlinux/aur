# Maintainer: Robert Wolff <mahlzahn@posteo.de>
pkgname=censor
pkgver=0.10.2
pkgrel=1
pkgdesc='PDF document redaction for the GNOME desktop'
arch=(x86_64)
url='https://codeberg.org/censor/Censor'
license=(GPL-3.0-or-later)
depends=(gtk4
         libadwaita
         python-cairo
         python-gobject
         'python-pymupdf>=1.28.2')
makedepends=(meson
             ninja)
checkdepends=(appstream-glib)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(70e6c75d24a7c3908fb984dc7f07c68d46c9734d3921c2085d73f52ba294290c)
validpgpkeys=()

blddir="$(pwd)/$pkgname-$pkgver-$pkgrel-build"

build() {
    arch-meson "$blddir" "$srcdir/$pkgname"
    meson compile -C "$blddir"
}

check() {
    meson test -C "$blddir"
}

package() {
    meson install -C "$blddir" --destdir "$pkgdir"
    cd "$pkgdir"
    python -m compileall --invalidation-mode=unchecked-hash .
}
