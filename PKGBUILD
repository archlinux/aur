# Maintainer: Todd E Johnson <todd@toddejohnson.net>
pkgname=trunk-recorder
pkgver=3.3.0
pkgrel=1
pkgdesc="Records calls from a Trunked Radio System (P25 & SmartNet)"
arch=(x86_64 i686 armv5 armv6h armv7h aarch64)
url="https://github.com/robotastic/trunk-recorder"
license=("GPL3")
depends=("gnuradio" "gnuradio-osmosdr" "libuhd")
makedepends=("cmake" "boost" "cppunit")
optdepends=()
source=("https://github.com/robotastic/trunk-recorder/archive/v${pkgver}.tar.gz"
  'trunk-recorder.service'
  'trunk-recorder.sysusers'
  'trunk-recorder.tmpfiles')
sha256sums=('4bf9de6503f6d3a0a83a87dfa487115a4cf94cb8a68893e5d5672244d3616efa'
  '413f2090a853422b8987bdb4dfa6cbcf7d5b75dbdb1989d030e7c19d3e9dfb9b'
  'f2e06d333ec8a64c869a9cf369015bf6e0b9819d2af259b4d1c411ed3cca78f8'
  'c20344ba366fcab3f3552e2b5e537f394406ab634f35c2b8858423ffa63fd0e8')

prepare() {
  rm -rf build
  mkdir build
}
build() {
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  #DESTDIR="$pkgdir" make install
  install -D -m 755 "recorder" "$pkgdir/usr/bin/recorder"
  install -D -m 755 "lib/op25_repeater/lib/libgnuradio-op25_repeater.so" "$pkgdir/usr/lib/libgnuradio-op25_repeater.so"
  install -D -m644 "../${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -D -m644 "../$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -D -m644 "../$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -D -m644 "../$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

