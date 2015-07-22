# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-fedora
_pkgname=gnome-terminal
pkgver=3.16.1
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with Fedora patches"
arch=(i686 x86_64)
license=(GPL)
depends=(vte3-notification gsettings-desktop-schemas dconf libnautilus-extension)
makedepends=(gnome-doc-utils intltool itstool docbook-xsl desktop-file-utils
             appdata-tools gnome-shell gconf vala yelp-tools)
optdepends=('gconf: settings migration when upgrading from older version')
options=('!emptydirs')
url="http://www.gnome.org"
conflicts=('gnome-terminal')
install=gnome-terminal-fedora.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
	gnome-terminal-restore-transparency.patch
	gnome-terminal-restore-dark.patch
	gnome-terminal-command-notify.patch)
sha256sums=('7dce4df5d88e4968ed64d57e61d51e2ab7944a02ece34d5776582a0ed3d7b45b'
            '00e8e84d6f348bfb4ac3c63c4971f4f1da1d603ca32deed45d8586f4aac73e1c'
            '5ef48574b93ec5530ce2747012fc0838a5e1ffa265803069a8da79b1be5e1eff'
            '9c7a4f631dce079892dad72cd9ee1a143fb637d1d9fc961bbde36defca89e7c3')

prepare () {
  cd $_pkgname-$pkgver

  patch -p1 -i ../gnome-terminal-restore-transparency.patch
  patch -p1 -i ../gnome-terminal-restore-dark.patch
  patch -p1 -i ../gnome-terminal-command-notify.patch

  autoreconf -f -i
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$_pkgname --disable-static --with-nautilus-extension \
    --enable-debug
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
