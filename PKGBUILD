# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nbsphinx-link
pkgname=python-${_base}
pkgdesc="A sphinx extension for including notebook files from outside sphinx source root"
pkgver=1.3.1
pkgrel=2
arch=(any)
url="https://github.com/vidartf/${_base}"
license=(BSD-3-Clause)
depends=(python-nbsphinx)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz
  docutils.patch::${url}/pull/26.patch)
sha512sums=('2a9e6cc7156f721ceeeeece6a432a8573aef31aaa7f61584fdc9b5d7a708faf12af274438f962eb444ac74a8021f093aa8ecd41c7d6934f2bf92dee183f8c397'
            'df62b059451ad745cd48241c02f0236ee749578d1f5ceea92bbc406b24dca83d33c18bfc826a1ac703b89c342471959aa19681731ce9313353a0a710aac80e6a')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../docutils.patch
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
