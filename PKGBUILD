# Maintainer: Peter Weber <peter.weber@ttyhoney.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.26.2
pkgrel=2
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
sha256sums=('3a9ba414a814569476515275ad303d8056f296b2669234447712559aa97005b0'
            'd33d721dfd8c4424ef2f673336ce5db3c54dd42f1a87d2e18d1b795992ff41da')

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
  LDFLAGS+=" -pthread"  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
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
