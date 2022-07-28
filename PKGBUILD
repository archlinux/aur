# Maintainer: Todd E Johnson <todd@toddejohnson.net>
options=(!buildflags)
pkgname=trunk-recorder
pkgver=4.3.2
_dlpkgver=${pkgver}
pkgrel=2
pkgdesc="Records calls from a Trunked Radio System (P25 & SmartNet)"
arch=(x86_64 i686 armv5 armv6h armv7h aarch64)
url="https://github.com/robotastic/trunk-recorder"
license=("GPL3")
depends=("gnuradio" "gnuradio-osmosdr" "libuhd" "boost" "boost-libs" "sox" "fdkaac")
makedepends=("cmake" "cppunit")
optdepends=()
source=("https://github.com/robotastic/trunk-recorder/archive/v${_dlpkgver}.tar.gz"
  'trunk-recorder.service'
  'trunk-recorder.sysusers'
  '682.patch'
  '698.patch'
  'trunk-recorder.tmpfiles')
sha256sums=('66e424419aefb81f78aa05af6358a09a770caf0f14c6926e6f4b8d6b70b065c3'
  '78bb66aa30af3395c2eddcafa3e59f65e59a328e04a093bb849a83cdedf01a0d'
  'f2e06d333ec8a64c869a9cf369015bf6e0b9819d2af259b4d1c411ed3cca78f8'
  'b7a38883ffd38a15bdd2858fd7b1f35d58d4679ac7c4789838a6f1c399bc7b57'
  '9ff08a0601ab27447eab51c10e4f84d8eb826e0bc1b13c4344a2cb53c60c91a3'
  'c20344ba366fcab3f3552e2b5e537f394406ab634f35c2b8858423ffa63fd0e8')

prepare() {
  rm -rf build
  mkdir build
  # Patch to work around https://github.com/robotastic/trunk-recorder/pull/682
  patch --directory="${pkgname}-${_dlpkgver}" --forward --strip=1 --input="${srcdir}/682.patch"
  # Patch to work around https://github.com/robotastic/trunk-recorder/pull/698/commits/dd25c29a59664f2ff2ead99fed38b7c78f41a35b
  patch --directory="${pkgname}-${_dlpkgver}" --forward --strip=1 --input="${srcdir}/698.patch"
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

