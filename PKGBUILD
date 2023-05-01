# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=muon-meson
pkgver=0.2.0
pkgrel=1
pkgdesc="meson implementation in C"
arch=(x86_64)
url="https://muon.build"
license=(GPL3)
source=("https://git.sr.ht/~lattis/muon/archive/$pkgver.tar.gz")
sha256sums=('d73db1be5388821179a25a15ba76fd59a8bf7c8709347a4ec2cb91755203f36c')
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
