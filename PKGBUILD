# Maintainer: Robert Wolff <mahlzahn@posteo.de>
pkgname=censor
pkgver=0.7.3
pkgrel=3
pkgdesc='PDF document redaction for the GNOME desktop'
arch=(x86_64)
url='https://codeberg.org/censor/Censor'
license=(GPL-3.0-or-later)
depends=(gtk4
         libadwaita
         python-cairo
         python-gobject
         'python-pymupdf>=1.27.2.3')
makedepends=(meson
             ninja)
checkdepends=(appstream-glib)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(7adaf5ed39acc6881fabe4d39fcb838087953d63a7d40f292b944cf9c1520fa6)
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
