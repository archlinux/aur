# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=2.0.1
pkgrel=1
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
sha512sums=('f63445994e9b92c90335e30bfe221573b2be70b28416052693f47e42dcef1253a33c1712220b977d1df5d4340644faf78fef01817ede39dc85b5687823412baf')

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
