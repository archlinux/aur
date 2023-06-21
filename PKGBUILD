# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-sleipnir-git
pkgver=r285.c5439b3
pkgrel=1
pkgdesc="A sparsity and linearity-exploiting interior-point solver, now with readable internals"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Sleipnir'
depends=('eigen' 'fmt' 'python-numpy')
makedepends=('cmake' 'pybind11' 'python-tox')
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
    -DUSE_SYSTEM_PYBIND=ON \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build

  cd "$srcdir"/Sleipnir
  python -m build --wheel
}

check() {
  ctest --test-dir build

  cd "$srcdir"/Sleipnir
  tox
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "$srcdir"/Sleipnir
  pip install dist/sleipnirgroup_jormungandr-*.whl --no-deps --root ${pkgdir} --ignore-installed
}
