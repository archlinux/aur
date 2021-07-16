# Contributor: Colin Keenan <colinnkeenan at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

# The difference between this PKGBUILD and the one for gnome-search-tool is "depends..."
# This will build gnome-search-tool without depending on nautilus.
# It depends on nautilus-data instead, also available in AUR, and so avoids gnome-desktop

pkgname=gnome-search-tool-no-nautilus
pkgver=3.6.0+82+g4a8f34e
pkgrel=1
pkgdesc="Utility to search for files without nautilus or gnome-desktop"
arch=(x86_64)
url="https://gitlab.gnome.org/Archive/gnome-search-tool"
license=(GPL2)
depends=(nautilus-data libsm)
makedepends=(intltool yelp-tools git gnome-common)
provides=('gnome-search-tool')
conflicts=('gnome-search-tool')
_commit=4a8f34e050fb794852264cf54feb7d449dd15965  # master
source=("git+https://gitlab.gnome.org/Archive/gnome-search-tool.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd gnome-search-tool
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gnome-search-tool

  # Fix configure
  sed -i '/^AM_GNU_GETTEXT/d' configure.ac

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd gnome-search-tool
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  make -C gnome-search-tool check
}

package() {
  DESTDIR="$pkgdir" make -C gnome-search-tool install
}

# vim:set ts=2 sw=2 et:
