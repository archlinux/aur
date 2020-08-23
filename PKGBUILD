# Maintainer: redfish <redfish@galactica.pw>

pkgname=lbrycrd
pkgver=0.17.3.2
pkgrel=1
pkgdesc='Blockchain daemon that provides the digital content namespace for the LBRY protocol'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://lbry.tech"
license=('MIT')
depends=('boost-libs' 'db' 'libevent' 'openssl') # db4.8 does not build for aarch64
optdepends=('miniupnpc' 'qt5-base' 'protobuf' 'qrencode')
makedepends=('boost')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lbryio/lbrycrd/archive/v${pkgver}.tar.gz"
	${pkgname}.service
	${pkgname}.conf
	include.patch)
install=$pkgname.install
backup=("etc/${pkgname}.conf")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < $srcdir/include.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --without-gui --with-incompatible-bdb
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  make install DESTDIR=$pkgdir

  rm -f $pkgdir/usr/bin/{bench_bitcoin,test_lbrycrd} \
   $pkgdir/usr/lib/libbitcoinconsensus.* \
   $pkgdir/usr/lib/pkgconfig/libbitcoinconsensus.pc \
   $pkgdir/usr/include/bitcoinconsensus.h

  install -Dm644 "$srcdir/${pkgname}.service"\
                 "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  src/test/test_lbrycrd
}

sha256sums=('1ac547aed45272ad4f5ff557407b804b37fc54b5e0b0bc0addedd2c9cb00a970'
            'd6424f9341ed1b21774fb9341721044cc737e7d633641cb92781773c2b2f77a8'
            'b97c87108220abf125421eef77f12718ffcff75c22765a0933858dcaf547f32c'
            'a29e666e626cf20df809a689fcb76e0950b7c2fbd6fb41eaccb71de1fbef3c51')
