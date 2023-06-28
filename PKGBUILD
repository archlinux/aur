# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname=libgedit-gtksourceview
pkgname="${_pkgname}-git"
pkgver=299.0.3+5+gffb59486
pkgrel=1
_pkgdesc=("Library that extends GtkTextView, the standard GTK "
          "widget for multiline text editing.")
pkgdesc="${_pkgdesc[@]}"
arch=(x86_64)
url="https://github.com/gedit-technology/${_pkgname}"
license=(LGPL2.1)
depends=(
  'gtk3'
  'libxml2'
)
makedepends=(
  'git'
  'gobject-introspection'
  'meson'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
