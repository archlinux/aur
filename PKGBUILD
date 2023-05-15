# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-sleipnir-git
pkgver=r228.f85c37e
pkgrel=1
pkgdesc="A sparsity and linearity-exploiting interior-point solver, now with readable internals"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Sleipnir'
depends=('fmt' 'eigen')
makedepends=('cmake')
license=('BSD')
options=('!strip' 'staticlibs')
source=('git+https://github.com/SleipnirGroup/Sleipnir')
md5sums=('SKIP')

pkgver() {
  cd Sleipnir
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -B build -S "Sleipnir" -DBUILD_BENCHMARKING=OFF -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

check() {
  cd build
  ctest
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Delete dependency installs
  rm -r "$pkgdir"/usr/include/eigen3
  rm -r "$pkgdir"/usr/include/fmt
  rm -r "$pkgdir"/usr/lib/cmake/fmt
  rm -r "$pkgdir"/usr/lib/libfmt.so*
  rm -r "$pkgdir"/usr/lib/pkgconfig
  rm -r "$pkgdir"/usr/share
}
