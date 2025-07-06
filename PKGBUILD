# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=muon-meson
pkgver=0.5.0
pkgrel=3
pkgdesc="meson implementation in C"
arch=(x86_64)
url="https://muon.build"
license=(GPL3)
source=("$url/releases/v$pkgver/muon-v$pkgver.tar.gz")
sha256sums=('b3b28758ead6c3b2edc3f77057dc41c574b3cb49813c2568c22dab4baf3c3afc')
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
  build-stage1/muon-bootstrap setup \
    -D libarchive=disabled \
    -D libcurl=disabled \
    -D libpkgconf=enabled \
    -D man-pages=disabled \
    -D meson-docs=disabled \
    -D meson-tests=disabled \
    -D readline=builtin \
    -D samurai=enabled \
    -D static=false \
    -D tracy=disabled \
    -D ui=disabled \
    -D website=disabled \
    build-stage2
  ninja -C build-stage2

  msg2 "Building stage 3 (muon from muon)"
  build-stage2/muon setup \
    -D libarchive=enabled \
    -D libcurl=enabled \
    -D libpkgconf=enabled \
    -D man-pages=enabled \
    -D meson-docs=disabled \
    -D readline=builtin \
    -D samurai=enabled \
    -D static=false \
    -D tracy=disabled \
    -D ui=disabled \
    -D website=disabled \
    -D prefix=/usr \
    -D b_lto=true \
    -D b_pie=true \
    build
  ninja -C build
}

check() {
  # Explicitly chose which test suites to run, to avoid running meson-tests
  # and taking a long time to run, but still having a reasonable coverage
  # to ensure that the built package works.
  cd "muon-v$pkgver/build"
  ./muon test -R -v -s fmt -s lang -s muon -s unit -s analyze
}

package() {
  cd "muon-v$pkgver/build"
  DESTDIR="$pkgdir" ./muon install
}
