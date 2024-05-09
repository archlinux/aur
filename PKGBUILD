# Maintainer: Nikl <nikl174@mailbox.org>
pkgname=colord-brightness
pkgver=1.0.2
pkgrel=1
pkgdesc="Adjust Display brightness with icc-profiles using the colord-daemon"
arch=("any")
url="https://github.com/Nikl174/colord-brightness"
license=('GPL')
groups=()
depends=(
  "colord"
  "lcms2"
  )
makedepends=(
  "cmake"
  "easyloggingpp"
  "pkgconf"
  )
options=()
#https://github.com/Nikl174/colord-brightness/archive/refs/tags/1.0.0.tar.gz
source=("https://github.com/Nikl174/$pkgname/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('a3eb63999843eb9eeb17c64bb1173193205d4dc241e96cae90402c2ed256bc82')

build() {
  cd "$pkgname-$pkgver"
  mkdir build && cd build || cd build

  cmake -DCMAKE_BUILD_TYPE="None" -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ..
  make
}

check() {
  cd "$pkgname-$pkgver"
  ctest --test-dir build --output-on-failure
}

package() {
  cd "$pkgname-$pkgver"

  cmake --install build/ --config Release --prefix="$pkgdir/usr"
  install -d "$pkgdir/usr/lib/systemd/user/"
  install -m 0644 scripts/$pkgname.service $pkgdir/usr/lib/systemd/user/
}
