# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nutils
pkgname=python-${_base}
pkgdesc="Numerical Utilities for Finite Element Analysis"
pkgver=7.3
pkgrel=1
arch=(any)
url="https://github.com/evalf/${_base}"
license=(MIT)
depends=(python-numpy python-treelog python-stringly python-bottombar)
makedepends=(python-build python-installer python-flit-core) # python-wheel
checkdepends=(python-pytest python-scipy intel-oneapi-mkl python-matplotlib python-meshio graphviz)
optdepends=('python-scipy: for Scipy matrix backend support'
  'intel-oneapi-mkl: for MKL matrix backend support'
  'python-matplotlib: for interpolation support'
  'python-meshio: for parsing gmsh files')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ddf2e4072a414cb0275095ee0219b5326f0d8f4fd203bca00276902b66bee84f686e1c00e067a1aaa7881e305c02748eaeb783102b99c3bdda9622f940eb31ed')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not cli'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
