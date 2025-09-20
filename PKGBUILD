# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-sleipnir-git
pkgver=0.1.0.r34.g7f89d55
pkgrel=1
pkgdesc="A sparsity and linearity-exploiting interior-point solver, now with readable internals"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Sleipnir'
depends=('eigen' 'python-numpy' 'python-scipy')
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
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  local glibc_version=$(pacman -Q glibc | cut -d ' ' -f 2 | cut -d '+' -f 1 | sed 's/\./_/')
  cp .py-build-cmake_cache/cp${python_version}-cp${python_version}-manylinux_${glibc_version}_$CARCH/_jormungandr.cpython-${python_version}-$CARCH-linux-gnu.so jormungandr
  PYTHONPATH=. pytest
}

package() {
  cmake --install build --prefix "$pkgdir"/usr

  cd "$srcdir"/Sleipnir
  python -m installer --destdir="$pkgdir" dist/*.whl
}
