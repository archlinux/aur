# Maintainer: Todd E Johnson <todd@toddejohnson.net>
options=(!buildflags)
pkgname=trunk-recorder
pkgver=4.5.0
_dlpkgver=${pkgver}
pkgrel=1
pkgdesc="Records calls from a Trunked Radio System (P25 & SmartNet)"
arch=(x86_64 i686 armv5 armv6h armv7h aarch64)
url="https://github.com/robotastic/trunk-recorder"
license=("GPL3")
depends=("gnuradio" "gnuradio-osmosdr" "libuhd" "boost" "boost-libs" "sox" "fdkaac")
makedepends=("cmake" "cppunit" "git")
optdepends=()
source=("https://github.com/robotastic/trunk-recorder/archive/v${_dlpkgver}.tar.gz"
  'trunk-recorder.service'
  'trunk-recorder.sysusers'
  'trunk-recorder.tmpfiles')
sha256sums=('7850cb9c0d91a153b6371c80124e081482e74ad4bd49b8e7b0ae2fc52ced5c6e'
  '78bb66aa30af3395c2eddcafa3e59f65e59a328e04a093bb849a83cdedf01a0d'
  'f2e06d333ec8a64c869a9cf369015bf6e0b9819d2af259b4d1c411ed3cca78f8'
  'c20344ba366fcab3f3552e2b5e537f394406ab634f35c2b8858423ffa63fd0e8')

prepare() {
  rm -rf build
  mkdir build
}
build() {
  cd build
  cmake "../${pkgname}-${_dlpkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  DESTDIR="$pkgdir" make install
  install -D -m644 "../${pkgname}-${_dlpkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -D -m644 "../$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -D -m644 "../$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

