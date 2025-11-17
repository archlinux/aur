# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-sleipnir-git
pkgver=0.3.1.r0.g71a1a45
pkgrel=1
pkgdesc="A sparsity and linearity-exploiting interior-point solver, now with readable internals"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Sleipnir'
depends=('eigen-git' 'python-numpy' 'python-scipy')
makedepends=('cmake' 'nanobind' 'python-build' 'python-installer')
checkdepends=('python-pytest')
license=('BSD')
options=('!strip' 'staticlibs')
provides=('sleipnirgroup-sleipnir')
conflicts=('sleipnirgroup-sleipnir')
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
    -DUSE_SYSTEM_EIGEN=ON \
    -DUSE_SYSTEM_NANOBIND=ON \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build

  cd "$srcdir"/Sleipnir
  python -m build --wheel
}

check() {
  ctest --test-dir build

  cd "$srcdir"/Sleipnir
  local glibc_version=$(pacman -Q glibc | cut -d ' ' -f 2 | cut -d '+' -f 1 | sed 's/\./_/')
  cp .py-build-cmake_cache/cp312-abi3-manylinux_${glibc_version}_$CARCH/_sleipnir.abi3.so python
  PYTHONPATH=. pytest
}

package() {
  cmake --install build --prefix "$pkgdir"/usr

  cd "$srcdir"/Sleipnir
  python -m installer --destdir="$pkgdir" dist/*.whl
}
