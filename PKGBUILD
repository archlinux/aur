# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=3.0.0
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(python-meshio python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-sparse)
optdepends=('python-h5py: for XDMF-export'
  'python-numba: for JIT compiler support'
  'python-sparse: for sparse arrays support')
#'python-einsumt: for multithreaded numpy.einsum support'
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f285422c97c377c08efa0f8afc35115aef091ecd5a7dd1b1f54f80979daa5719a751a42bf7f299a412769e8400acf8a794d5d013fca504ad83cc3cee876d7b0d')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
