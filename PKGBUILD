# Maintainer: Peter Weber <peter.weber@ttyhoney.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.24.1
pkgrel=1
pkgdesc="The GNOME Terminal Emulator, with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(i686 x86_64)
license=(GPL)
depends=(vte3 gsettings-desktop-schemas dconf)
makedepends=(intltool itstool docbook-xsl libnautilus-extension appdata-tools
             gnome-shell gconf vala yelp-tools)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
groups=(gnome)
changelog=$pkgname.changelog
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        gnome-terminal-transparency.patch)
sha256sums=('a7bf26e6fcc335ca7b8fb94e13262f44357961c0f38ca3f2e0066426e91a60e0'
            '9eedefadfcf1d8d3d6605fc8b2d1d7ed95d31cd5c044f806e7185f3c987a01ae')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../gnome-terminal-transparency.patch
  # possiblity, use autoreconf:
  # http://www.gnu.org/software/autoconf/autoconf.html
  # https://wiki.debian.org/Autoreconf
  # autoreconf -fvi
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$_pkgname --disable-static --with-nautilus-extension
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
