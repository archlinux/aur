# Maintainer: Todd E Johnson <todd@toddejohnson.net>
pkgname=trunk-recorder-git
pkgver=r1543.9f57d36
pkgrel=1
pkgdesc="Records calls from a Trunked Radio System (P25 & SmartNet)"
arch=(x86_64 i686 armv5 armv6h armv7h aarch64)
url="https://github.com/robotastic/trunk-recorder"
license=("GPL3")
depends=("gnuradio" "gnuradio-osmosdr" "libuhd")
makedepends=("git" "cmake" "boost" "cppunit")
optdepends=()
source=(${pkgname}::git+"https://github.com/robotastic/trunk-recorder.git#branch=4.0-beta"
  'trunk-recorder.service'
  'trunk-recorder.sysusers'
  'trunk-recorder.tmpfiles')
sha256sums=('SKIP'
  '413f2090a853422b8987bdb4dfa6cbcf7d5b75dbdb1989d030e7c19d3e9dfb9b'
  'f2e06d333ec8a64c869a9cf369015bf6e0b9819d2af259b4d1c411ed3cca78f8'
  'c20344ba366fcab3f3552e2b5e537f394406ab634f35c2b8858423ffa63fd0e8')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf build
  mkdir build
}
build() {
  cd build
  cmake "../${pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  #DESTDIR="$pkgdir" make install
  install -D -m 755 "recorder" "$pkgdir/usr/bin/recorder"
  install -D -m 755 "libgnuradio-op25_repeater.so" "$pkgdir/usr/lib/libgnuradio-op25_repeater.so"
  install -D -m 755 "libunit_script.so" "$pkgdir/usr/lib/libunit_script.so"
  install -D -m 755 "libopenmhz_uploader.so" "$pkgdir/usr/lib/libopenmhz_uploader.so"
  install -D -m 755 "libbroadcastify_uploader.so" "$pkgdir/usr/lib/libbroadcastify_uploader.so"
  install -D -m644 "../${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../trunk-recorder.service" "$pkgdir/usr/lib/systemd/system/trunk-recorder.service"
  install -D -m644 "../trunk-recorder.sysusers" "$pkgdir/usr/lib/sysusers.d/trunk-recorder.conf"
  install -D -m644 "../trunk-recorder.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/trunk-recorder.conf"
}

