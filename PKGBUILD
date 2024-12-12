# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=espeak-ng
pkgver=1.52.0
pkgrel=1
pkgdesc='Multi-lingual software speech synthesizer'
url=https://github.com/espeak-ng/espeak-ng
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  pcaudiolib
  libsonic
)
checkdepends=(python)
makedepends=(
  cmake
  git
  ruby-ronn-ng
)
replaces=(espeak-ng-espeak)
provides=(espeak-ng-espeak)
conflicts=(
  espeak-ng-espeak
  espeak
)
source=("git+$url.git#tag=$pkgver")
b2sums=('f934eb948035222de2c6b5c7d8c9e104e0326ceb1052859598ed6f0010fd975bc3e1ef26ac60f77c3b6d1a4aa567b4b7d3c75639dca89eef2508be2a680f7c2b')

build() {
  cmake -B build -S "${pkgname%-git}" -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DESPEAK_COMPAT=ON \
        -DESPEAK_BUILD_MANPAGES=ON \
        -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rv "$pkgdir"/usr/include/espeak
}

# vim:set ts=2 sw=2 et:
