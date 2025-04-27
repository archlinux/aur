# Maintainer: Martin Larralde <martin.larralde@embl.de>

pkgname=strobealign
pkgver=0.16.0
pkgrel=1
pkgdesc="Aligns short reads using dynamic seed size with strobemers. https://doi.org/10.1186/s13059-022-02831-7"
arch=('x86_64' 'aarch64' 'ppc64le')
url="https://github.com/ksahlin/strobealign"
license=('MIT')
depends=('glibc' 'openmp' 'zlib' 'isa-l')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3fd4c95991a149b7edcafc91949a827d74f65e031ea08a73a878bef4ed123afa')

prepare() {
  local cmake_options=(
    -B build
    -S "$pkgname-$pkgver"
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
}

build() {
  cmake --build build
}

check() {
  cd "$pkgname-$pkgver"
  "$srcdir"/build/test-strobealign
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver"/LICENSE
}
