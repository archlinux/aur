# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=mate-settings-daemon
pkgname=${_pkgname}-git
pkgver=1.29.1.r2.g927e9dc
pkgrel=1
pkgdesc="The MATE Settings daemon"
arch=(x86_64)
url='https://github.com/mate-desktop/mate-settings-daemon'
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  dbus
  dbus-glib
  dconf
  fontconfig
  gdk-pixbuf2
  glib2
  glibc
  gtk-layer-shell
  gtk3
  hicolor-icon-theme
  libcanberra
  libgcc
  libmatekbd
  libmatemixer
  libnotify
  libpulse
  libx11
  libxi
  libxklavier
  mate-desktop
  nspr
  nss
  polkit
)
makedepends=(
  git
  glib2-devel
  mate-common
  wayland-protocols
)
source=("git+https://github.com/mate-desktop/mate-settings-daemon.git")
groups=('mate-git')
sha256sums=('SKIP')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd $_pkgname
  autoreconf -fiv
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --libexecdir="/usr/lib/$_pkgname" \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-pulse \
    --enable-wayland
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
