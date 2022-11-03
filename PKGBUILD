# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=5.3.0
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-meshio python-h5py python-matplotlib)
optdepends=('python-meshio: for export mesh'
  'python-h5py: for XDMF-export'
  'python-numba: for JIT compiler support'
  'python-sparse: for sparse arrays support'
  'python-einsumt: for multithreaded numpy.einsum support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8041a68d0638eb4f573bec20bd68abe0e722c79318f4192342f89388a71fd2111ee9359b6bf0595ec446c2db0924a0f5e2dfb2ec3b3b48811d93a898f21ada2e')

build() {
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest tests -k 'not form and not mechanics and not mpc and not newton'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
