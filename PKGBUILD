# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=mate-utils
pkgname=${_pkgname}-git
pkgver=1.29.1.r7.gc045dfb7
pkgrel=1
pkgdesc="Common MATE utilities for viewing disk usage, logs and fonts, taking screenshots, managing dictionaries and searching files"
arch=(x86_64)
url='https://github.com/mate-desktop/mate-utils'
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  dconf
  gdk-pixbuf2
  glib2
  glibc
  gtk-layer-shell
  gtk3
  hicolor-icon-theme
  libcanberra
  libgcc
  libgtop
  libice
  libsm
  libx11
  libxext
  mate-desktop
  pango
  udisks2
  wayland
  zlib
)
makedepends=(
  git
  glib2-devel
  gtk-doc
  mate-common
  mate-panel
  wayland-protocols
  yelp-tools
)
optdepends=('mate-panel: Look up words in dictionaries from the panel')
groups=(mate-extra)
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^[vV]//'
}

prepare() {
  cd $_pkgname
 
  git submodule init
  git submodule update

  autoreconf -fiv
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk-doc \
    --enable-in-process \
    --enable-wayland
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
