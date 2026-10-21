# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=libosmocore-git
pkgver=1.14.2.r11.4ba7d4d33
pkgrel=1
pkgdesc="Osmocom core libraries"
arch=('armv7h' 'i686' 'x86_64')
url="https://osmocom.org/projects/libosmocore/"
license=('GPL-2.0-or-later')
depends=('pcsclite' 'talloc' 'libusb' 'lksctp-tools' 'libmnl' 'gnutls' 'systemd-libs' 'liburing')
makedepends=('git' 'python')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}"
          'libosmocodec.so=4-64'
          'libosmocoding.so=0-64'
          'libosmocore.so=22-64'
          'libosmoctrl.so=0-64'
          'libosmogb.so=14-64'
          'libosmogsm.so=20-64'
          'libosmoisdn.so=0-64'
          'libosmosim.so=2-64'
          'libosmousb.so=0-64'
          'libosmovty.so=13-64')
source=("git+https://gitea.osmocom.org/osmocom/libosmocore.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf -i
  ./configure --prefix=/usr \
              --exec-prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --datadir=/usr/share \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --docdir=/usr/share/doc/libosmocore \
              --libdir=/usr/lib/ \
              --enable-systemd-logging
  make
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make check
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
