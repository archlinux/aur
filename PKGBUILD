# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=muon-meson
pkgver=0.3.1
pkgrel=1
pkgdesc="meson implementation in C"
arch=(x86_64)
url="https://muon.build"
license=(GPL3)
source=("$url/releases/v$pkgver/muon-v$pkgver.tar.gz")
sha256sums=('45f6ad728946a0788188004e3a88a77a7d07b48525ce0646430589d1db4c832e')
depends=(pkgconf curl libarchive)
makedepends=(ninja python-yaml scdoc)
checkdepends=(git)
provides=(muon)

build() {
  cd "muon-v$pkgver"
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
  cd "muon-v$pkgver/build"
  ./muon test
}

package() {
  cd "muon-v$pkgver/build"
  DESTDIR="$pkgdir" ./muon install

  # remove this as the `meson` package also provides it
  # muon only has a `docs` option right now, so
  # downloading/generating/deleting is the only option :/
  rm "$pkgdir"/usr/share/man/man3/meson-reference.3
}
