# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=ocserv
pkgver=0.3.5
pkgrel=1
pkgdesc="OpenConnect VPN Server"
arch=('i686' 'x86_64')
url="http://www.infradead.org/ocserv/"
license=('GPL2')
depends=('autogen' 'libpcl' 'gnutls' 'http-parser' 'libdbus' 'libnl' 'libsystemd' 'pam' 'protobuf-c')
backup=('etc/ocserv.config' 'etc/ocserv-passwd')
source=("ftp://ftp.infradead.org/pub/ocserv/ocserv-$pkgver.tar.xz"
	"install.patch")
sha256sums=('a420bff8d26bd7b1e820b875a264bd8fdae871770120f3adf131b040cbf6ed9a'
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
sha256sums=('44949e530ec9f43ba95c53ba59ff686428c575191077715cb3b8c4b39da4b3b5'
            '81ae628d912e6edb928ce0e62d26807b319866ba0bbf0a2d8c14385a959a9203')
