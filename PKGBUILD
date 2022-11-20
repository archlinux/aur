# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=python38-blosc
pkgver=1.10.6
pkgrel=5
pkgdesc="Python wrapper for the extremely fast Blosc compression library"
arch=(x86_64)
url="http://python-blosc.blosc.org/"
license=(BSD)
depends=(python38 blosc)
optdepends=('python38-numpy: for tests and benchmarks')
makedepends=(python38-scikit-build ninja)
checkdepends=(python38-numpy python38-psutil)
source=(https://github.com/Blosc/python-blosc/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('e283b132ebb91e7ce362ec65a1d6760e3793046371ea545a9e842372084182bcc194c3a0e1cb20914de58554063995a238ea0a129214731689e8cd5f4203d3ed')
b2sums=('44f444fa5050a6198e83649973fc82d6804eec50bf79c332ed6a974e417f2a58baf09480a9bb5c5b7abcef2a961cd7bc61f962c12db625b1a7c48799ace0b39a')

build() {
  cd ${pkgname}-${pkgver}
  export INCLUDE_SNAPPY=1 # Disabled by default for compatibility with non-C++ systems
  python3.8 setup.py build --build-type none -DUSE_SYSTEM_BLOSC=ON -DCMAKE_C_FLAGS_INIT=-DNDEBUG
}

check() {
  local python_version=$(python3.8 -m 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  cd ${pkgname}-${pkgver}/_skbuild/linux-${CARCH}-${python_version}/setuptools/lib
  PYTHONPATH=${PWD} python3.8 blosc/test.py -v
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py --skip-cmake install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/$pkgname/
}
