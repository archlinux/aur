# Maintainer: 0xMRTT < 0xMRTT at proton dot me >

pkgname=accumulate-git
_pkgname=Accumulate
pkgver=r4.9632f61
pkgrel=1
pkgdesc="Accumulate anonymous GNOME data"
arch=('x86_64')
url="https://github.com/Atrophaneura/Accumulate"
license=('GPL3')
depends=('libadwaita' 'python-gobject')
makedepends=('git' 'meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" accumulate-git)
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
