# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=muon-meson
pkgver=0.1.0
pkgrel=1
pkgdesc="meson implementation in C"
arch=(x86_64)
url="https://muon.build"
license=(GPL3)
source=("https://git.sr.ht/~lattis/muon/archive/$pkgver.tar.gz")
sha256sums=('9d3825c2d562f8f8ad96d1f02167e89c4e84973decf205d127efd9293d7da35b')
depends=(pkgconf curl libarchive)
makedepends=(ninja python-yaml scdoc)
checkdepends=(git)
provides=(muon)

build() {
  cd muon-$pkgver
  rm -rf build*

  msg2 "Building stage 1 (bootstrap)"
  ./bootstrap.sh build-stage1

  msg2 "Building stage 2 (muon from bootstrap)"
  build-stage1/muon setup build-stage2
  ninja -C build-stage2

  msg2 "Building stage 3 (muon from muon)"
  build-stage2/muon setup \
    -D prefix=/usr \
    -D b_lto=true \
    -D b_pie=true \
    build
  ninja -C build
}

check() {
  cd muon-$pkgver/build
  ./muon test
}

package() {
  cd muon-$pkgver/build
  DESTDIR="$pkgdir" ./muon install
}
