# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=libosmocore-git
pkgver=1.8.0.r249.a7d7cf28
pkgrel=1
pkgdesc="Osmocom core library"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/libosmocore/wiki/Libosmocore"
license=('GPL')
depends=('pcsclite' 'talloc' 'libusb' 'lksctp-tools' 'libmnl' 'gnutls' 'systemd-libs' 'liburing')
makedepends=('git' 'python')
conflicts=('libosmocore')
provides=("libosmocore=${pkgver}")
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

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=$pkgdir install
}
