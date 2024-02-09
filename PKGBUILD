# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-sleipnir-git
pkgver=0.0.1.r7.g0d2f676
pkgrel=1
pkgdesc="A sparsity and linearity-exploiting interior-point solver, now with readable internals"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Sleipnir'
depends=('eigen-git' 'fmt' 'python-numpy' 'python-scipy')
makedepends=('cmake' 'pybind11' 'python-py-build-cmake')
checkdepends=('python-pytest')
license=('BSD')
options=('!strip' 'staticlibs')
source=('git+https://github.com/SleipnirGroup/Sleipnir')
md5sums=('SKIP')

pkgver() {
  cd Sleipnir
  printf "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir"/Sleipnir
  ./tools/update_version.py
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
  python -m build --wheel --no-isolation
}

check() {
  ctest --test-dir build

  cd "$srcdir"/Sleipnir
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cp .py-build-cmake_cache/cp${python_version}-cp${python_version}-linux_$CARCH/_jormungandr.cpython-${python_version}-$CARCH-linux-gnu.so jormungandr
  PYTHONPATH=. pytest
}

package() {
  cmake --install build --prefix "$pkgdir"/usr

  cd "$srcdir"/Sleipnir
  python -m installer --destdir="$pkgdir" dist/*.whl
}
