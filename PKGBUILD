# Maintainer: Todd E Johnson <todd@toddejohnson.net>
options=(!strip !buildflags debug)
_name=trunk-recorder
pkgname=${_name}-git
pkgver=r2045.fc16d6e
pkgrel=1
pkgdesc="Records calls from a Trunked Radio System (P25 & SmartNet)"
arch=(x86_64 i686 armv5 armv6h armv7h aarch64)
url="https://github.com/robotastic/trunk-recorder"
license=("GPL3")
depends=("gnuradio" "gnuradio-osmosdr" "libuhd" "boost" "boost-libs" "sox" "fdkaac")
makedepends=("git" "cmake" "cppunit")
optdepends=()
conflicts=('trunk-recorder')
provides=('trunk-recorder')
source=(${_name}::git+"https://github.com/robotastic/trunk-recorder.git"
  'trunk-recorder.service'
  'trunk-recorder.sysusers'
  'trunk-recorder.tmpfiles')
sha256sums=('SKIP'
  '78bb66aa30af3395c2eddcafa3e59f65e59a328e04a093bb849a83cdedf01a0d'
  'f2e06d333ec8a64c869a9cf369015bf6e0b9819d2af259b4d1c411ed3cca78f8'
  'c20344ba366fcab3f3552e2b5e537f394406ab634f35c2b8858423ffa63fd0e8')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf build
  mkdir build
}
build() {
  cd build
  cmake "../${_name}" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -d -m755 "$pkgdir/etc/trunk-recorder"
  install -D -m644 "../${_name}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "../${_name}.service" "$pkgdir/usr/lib/systemd/system/${_name}.service"
  install -D -m644 "../${_name}.sysusers" "$pkgdir/usr/lib/sysusers.d/${_name}.conf"
  install -D -m644 "../${_name}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_name}.conf"
}

