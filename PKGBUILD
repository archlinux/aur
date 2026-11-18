# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=mate-desktop
pkgname=${_pkgname}-git
pkgver=1.29.1.r0.gf1a64ea
pkgrel=1
pkgdesc="Library with common API for various MATE modules"
arch=(x86_64)
url='https://github.com/mate-desktop/mate-desktop'
license=('GPL-2.0-or-later AND LGPL-2.0-or-later')
depends=(
  at-spi2-core
  cairo
  dconf
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  iso-codes
  libgcc
  libx11
  libxrandr
  startup-notification
)
makedepends=(
  git
  gobject-introspection
  gtk-doc
  mate-common
  meson
)
groups=('mate-git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
source=("git+https://github.com/mate-desktop/mate-desktop.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  local meson_options=(
    -D gtk-doc=true
    -D introspection=true
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
