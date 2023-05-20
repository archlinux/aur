# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-sleipnir-git
pkgver=r233.a9119f7
pkgrel=1
pkgdesc="A sparsity and linearity-exploiting interior-point solver, now with readable internals"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Sleipnir'
depends=('eigen' 'fmt')
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
  cmake -B build -S "Sleipnir" \
    -DBUILD_BENCHMARKING=OFF \
    -DUSE_SYSTEM_EIGEN=ON \
    -DUSE_SYSTEM_FMT=ON \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

check() {
  cd build
  ctest
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
