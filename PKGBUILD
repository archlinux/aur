# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
pkgname=libosmocore-git
pkgver=1.7.0.r48.724c1625
pkgrel=1
pkgdesc="Osmocom core library"
arch=('x86_64' 'i686')
url="https://osmocom.org/projects/libosmocore/wiki/Libosmocore"
license=('GPL')
depends=('pcsclite' 'talloc' 'libusb' 'lksctp-tools' 'libmnl')
makedepends=('git' 'autoconf' 'automake' 'make' 'gcc' 'libtool' 'pkg-config' 'python')
conflicts=('libosmocore')
provides=('libosmocore=${pkgver}')
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
              --sbindir=/usr/sbin \
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
