# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=mate-session-manager
pkgname=${_pkgname}-git
pkgver=1.29.0.r2.g419f2ce
pkgrel=1
pkgdesc="The MATE Session Handler"
arch=(x86_64)
url='https://github.com/mate-desktop/mate-session-manager'
license=(GPL-2.0-or-later)
depends=(
  bash
  cairo
  dbus
  dbus-glib
  dconf
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libepoxy
  libgcc
  libglvnd
  libice
  libsm
  libx11
  libxau
  libxcomposite
  libxext
  libxrender
  libxtst
  mate-desktop
  systemd-libs
  wayland
)
makedepends=(
  docbook-xsl
  git
  glib2-devel
  mate-common
  wayland-protocols
  xmlto
  xtrans
)
optdepends=(
  'gnome-keyring: keyring support'
  'xdg-user-dirs-gtk: manage user directories'
)
source=("git+https://github.com/mate-desktop/mate-session-manager.git")
groups=('mate-git')
sha256sums=('SKIP')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive

  autoreconf -fiv
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --libexecdir="/usr/lib/$_pkgname" \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
