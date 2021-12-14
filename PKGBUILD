# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=1.6.0
pkgrel=2
arch=('any')
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(python-meshio python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-sparse)
optdepends=('python-h5py: for XDMF-export'
  'python-numba: for JIT compiler support'
  'python-sparse: for sparse arrays support')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f2bd7f8e0e29cbd02c98886e10f8e8fabc7e60e99d9008eeea38b7ebb30a1e13c8050fee1d414b4cb32b1b3c9a507a1540396b3dcdc7238025fb9fd0a151aa6f')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest tests
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
