# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=0.8.0
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="http://www.infradead.org/ocserv/"
license=('GPL2')
depends=('autogen' 'libpcl' 'gnutls' 'http-parser' 'libnl' 'libsystemd' 'pam' 'protobuf-c' 'talloc')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("ftp://ftp.infradead.org/pub/ocserv/ocserv-$pkgver.tar.xz"
	"install.patch")
sha256sums=('b361be2d8dadf7ba886f01803204dd8ce0dfeb7a1747e413d61e5da75bc5505a'
            '81ae628d912e6edb928ce0e62d26807b319866ba0bbf0a2d8c14385a959a9203')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  sed -e 's/CPPFunction/rl_completion_func_t/' -i src/occtl.c
  patch -Np2 -b -z .orig <"$srcdir/install.patch"
  autoreconf -fi
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" install
  install -Dm0644 doc/sample.config "$pkgdir/etc/ocserv.config"
  install -Dm0600 doc/sample.passwd "$pkgdir/etc/ocserv-passwd"
}
