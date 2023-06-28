# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

_pkgname=d-feet
pkgname="${_pkgname}-git"
pkgver=0.3.16.r15.g4f00ee6
pkgrel=1
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
license=('GPL2')
depends=(
  gtk3
  python-gobject
)
makedepends=(
  gobject-introspection
  meson
  python-pycodestyle
  yelp-tools
)
checkdepends=('xorg-server-xvfb')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "git+${url}.git"
  meson-drop-unused-argument.patch
)
sha512sums=(
  'SKIP'
  '019dbeff67c22eccab4e34ed3c3aa292a86c6113f0f9575ecbec948aa5e2fc06f0f862d8e07d8ce566045e6aeb985cebddbc3c70ce6cffc8a074c1e08c80e27c'
)

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" \
                      "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${_pkgname}"
  patch -Np1 -i ${srcdir}/meson-drop-unused-argument.patch
}

build() {
    arch-meson "${_pkgname}" build
    meson compile -C build
}

check() {
  xvfb-run meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
  python -m compileall -d /usr/lib "${pkgdir}/usr/lib"
  python -O -m compileall -d /usr/lib "${pkgdir}/usr/lib"
}
