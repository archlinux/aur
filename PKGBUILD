# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=d-feet-git
pkgver=0.3.16.r1.g7874512
pkgrel=1
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://gitlab.gnome.org/GNOME/d-feet"
license=('GPL2')
depends=('gtk3' 'glib2' 'python-gobject' 'python>=2.7')
makedepends=('meson' 'gobject-introspection')
checkdepends=('xorg-server-xvfb')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    arch-meson "${pkgname%-git}" build
    meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
