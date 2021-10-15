# Maintainer: Todd E Johnson <todd@toddejohnson.net>
options=(debug !strip libtool staticlibs !ccache !distcc !zipman docs emptydirs) 
pkgname=trunk-recorder-git
pkgver=r1619.30f26ab
pkgrel=1
pkgdesc="Records calls from a Trunked Radio System (P25 & SmartNet)"
arch=(x86_64 i686 armv5 armv6h armv7h aarch64)
url="https://github.com/robotastic/trunk-recorder"
license=("GPL3")
depends=("gnuradio" "gnuradio-osmosdr" "libuhd" "boost" "boost-libs" "sox" "fdkaac")
makedepends=("git" "cmake" "cppunit")
optdepends=()
source=(${pkgname}::git+"https://github.com/robotastic/trunk-recorder.git"
  'trunk-recorder.service'
  'trunk-recorder.sysusers'
  'trunk-recorder.tmpfiles')
sha256sums=('SKIP'
  '60193b9007ae10c05f70155c909fe2882432a5771d658e733c3d3d89cf46d949'
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
  CFLAGS=${CFLAGS/-fvar-tracking-assignments}
  CXXFLAGS=${CXXFLAGS/-fvar-tracking-assignments}
  cd build
  cmake "../${pkgname}" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -j $(nproc)
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -d -m755 "$pkgdir/etc/trunk-recorder"
  install -D -m644 "../${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../trunk-recorder.service" "$pkgdir/usr/lib/systemd/system/trunk-recorder.service"
  install -D -m644 "../trunk-recorder.sysusers" "$pkgdir/usr/lib/sysusers.d/trunk-recorder.conf"
  install -D -m644 "../trunk-recorder.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/trunk-recorder.conf"
}

