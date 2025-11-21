pkgname=openbsd-netcat-tls
pkgver=1.234
pkgrel=1
_libresslver=4.2.1
arch=('x86_64')
pkgdesc="TCP/IP swiss army knife. The actual OpenBSD variant with TLS support"
url=https://www.libressl.org
license=('isc' 'custom:Openssl')
depends=('ca-certificates')
makedepends=('libbsd' 'cmake')
provides=('netcat')
conflicts=('openbsd-netcat' 'gnu-netcat')
source=("https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${_libresslver}.tar.gz")
sha256sums=('6d5c2f58583588ea791f4c8645004071d00dfa554a5bf788a006ca1eb5abd70b')

pkgver() {
  cd "$srcdir/libressl-${_libresslver}"
  sed -n 's/.*netcat\.c,v \([0-9.]*\).*/\1/p; q' apps/nc/netcat.c
}

build() {
  cd $srcdir/libressl-${_libresslver}/
  cmake -B build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENSSLDIR=/etc/ssl \
    -DLIBRESSL_APPS=ON \
    -DBUILD_SHARED_LIBS=OFF
  cmake --build build --target nc
}

package() {
  cd $srcdir/libressl-${_libresslver}
  install -Dm 755 ./build/apps/nc/nc $pkgdir/usr/bin/nc
  ln -s nc $pkgdir/usr/bin/netcat
  install -Dm 644 ./apps/nc/nc.1 $pkgdir/usr/share/man/man1/nc.1
  install -Dm 644 ./COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
