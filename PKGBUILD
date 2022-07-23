# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=muon-meson-git
_pkgname=${pkgname%-meson-git}
pkgver=r1578.abccd1790d1130ea6f6a
pkgrel=1
pkgdesc='meson implementation in C'
url='https://sr.ht/~lattis/muon'
license=(GPL3)
arch=(x86_64)
depends=(pkgconf curl zlib libarchive)
makedepends=(git scdoc ninja)
conflicts=()
provides=(muon)
source=("git+https://git.sr.ht/~lattis/muon")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
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
  cd "$_pkgname/build"
  ./muon test
}

package() {
  cd "$_pkgname/build"
  DESTDIR="$pkgdir" ./muon install
}
