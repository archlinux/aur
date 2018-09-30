# Maintainer: Peter Weber <peter.weber@mailbox.org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.30.1
pkgrel=1
pkgdesc="The GNOME Terminal Emulator, with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=('vte3>=0.54.1' gsettings-desktop-schemas dconf)
makedepends=(intltool itstool docbook-xsl libnautilus-extension appdata-tools
             gnome-shell vala yelp-tools)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
groups=(gnome)
changelog=package.changelog
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        transparency.patch)
sha256sums=('e90720d4581da29d7c47d35d4fe81b46a9b4fbdb85e3b6b67dec298552b13228'
            '45f1b52079f5d16ae8d84619479040bced7cc7beb60313350611a695fef0bf40')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../transparency.patch
  # autogen.sh not in tarball
  autoreconf -fiv
}

build() {
  cd $_pkgname-$pkgver
  LDFLAGS+=" -pthread"  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --disable-static --with-nautilus-extension
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
