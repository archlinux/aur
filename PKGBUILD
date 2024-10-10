# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=3.1.2
pkgrel=3
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL-3.0-or-later)
depends=(precice python-mpi4py)
makedepends=(python-build python-installer python-setuptools cython python-pkgconfig python-wheel)
source=(python-bindings-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  numpy2.patch::${url}/pull/218.patch)
sha512sums=('afe414c12c007c8ee7c3b953c4ca0415477f4358c9146766d8c2a437e095d90beff6353a32515a6f6b2e9652a5952b09688e4a353a29ebfd501616851b85f97e'
  'd75856e1d2782e5d84df81d2491eec997ea7b606cb6c6505ddc2163334fcbc21eab9ee1d60007974533c82def3210ef01f25fa10c94a509783d3efdb92574118')

prepare() {
  cd python-bindings-${pkgver}
  patch -p1 -i ../numpy2.patch
}

build() {
  cd python-bindings-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd python-bindings-${pkgver}
  # FIXME: https://github.com/precice/python-bindings/issues/1
  python setup.py test
}
package() {
  cd python-bindings-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
