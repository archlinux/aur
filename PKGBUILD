# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=sleipnirgroup-sleipnir
pkgver=0.5.4
pkgrel=1
pkgdesc="Reverse mode autodiff library, interior-point method, and NLP solver DSL"
arch=('x86_64')
url='https://github.com/SleipnirGroup/Sleipnir'
depends=('eigen-git' 'python-numpy' 'python-scipy')
makedepends=('cmake' 'git' 'nanobind' 'python-build' 'python-installer')
checkdepends=('python-pytest')
license=('BSD')
options=('!strip' 'staticlibs')
provides=('sleipnirgroup-sleipnir')
conflicts=('sleipnirgroup-sleipnir')
source=("git+https://github.com/SleipnirGroup/Sleipnir#tag=v${pkgver}")
md5sums=('371fa4237c81e142b2c0781bf0135482')

prepare() {
  cd "$srcdir"/Sleipnir
  ./tools/update_version.py
}

build() {
  cmake -B build -S "Sleipnir" \
    -DSLEIPNIR_USE_SYSTEM_EIGEN=ON \
    -DSLEIPNIR_USE_SYSTEM_NANOBIND=ON \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build

  cd "$srcdir"/Sleipnir
  python -m build --wheel
}

check() {
  ctest --test-dir build

  cd "$srcdir"/Sleipnir
  local glibc_version=$(pacman -Q glibc | cut -d ' ' -f 2 | cut -d '+' -f 1 | sed 's/\./_/')
  cp .py-build-cmake_cache/cp312-abi3-manylinux_${glibc_version}_$CARCH/_sleipnir.abi3.so python/src/sleipnir
  PYTHONPATH=python/src pytest
}

package() {
  cmake --install build --prefix "$pkgdir"/usr

  cd "$srcdir"/Sleipnir
  python -m installer --destdir="$pkgdir" dist/*.whl
}
