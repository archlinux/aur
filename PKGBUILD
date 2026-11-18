# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=caja
pkgname=${_pkgname}-git
pkgver=1.29.1.r35.g4de76eb2
pkgrel=1
pkgdesc="File manager for the MATE desktop"
arch=(x86_64)
url='https://github.com/mate-desktop/caja'
license=('GPL-2.0-or-later AND LGPL-2.0-or-later')
depends=(
  at-spi2-core
  cairo
  dconf
  exempi
  gdk-pixbuf2
  glib2
  glibc
  gtk-layer-shell
  gtk3
  gvfs
  hicolor-icon-theme
  libexif
  libgcc
  libice
  libnotify
  libsm
  libx11
  libxml2
  mate-desktop
  pango
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  mate-common
  meson
)
optdepends=('gstreamer: automatic media playback when mouseover')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")
groups=('mate-git')
source=("git+https://github.com/mate-desktop/caja.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^[vV]//'
}

prepare() {
  cd "${_pkgname}"
 
  git submodule init
  git submodule update
  
  autoreconf -fiv
}

build() {
  cd "${_pkgname}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk-doc \
    --disable-update-mimedb \
    --disable-self-check # self-check only checks for eel in make check, requires Xorg server
  make
}

check() {
  cd "${_pkgname}"
  make check
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
}
