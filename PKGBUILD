# Maintainer: Peter Weber <peter.weber@mailbox.org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.28.2
pkgrel=1
pkgdesc="The GNOME Terminal Emulator, with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=('vte3>=0.52.0' gsettings-desktop-schemas dconf)
makedepends=(intltool itstool docbook-xsl libnautilus-extension appdata-tools
             gnome-shell gconf vala yelp-tools)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
groups=(gnome)
changelog=package.changelog
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        transparency.patch)
sha256sums=('a283dca4980eecf9184a55aac03fef99f85748461ff190423a2253f3b4557279'
            'cd3e0adb14b1002e53a086edf803923d1a2d9974419e20777968eed7199cbca0')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../transparency.patch
  # autogen.sh not in tarball
  autoreconf -fiv
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
