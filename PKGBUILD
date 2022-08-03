# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scikit-fem
pkgname=python-${_base}
pkgdesc="Simple finite element assemblers"
pkgver=7.0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/kinnala/${_base}"
license=('custom:BSD-3-clause')
depends=(python-scipy)
makedepends=(python-setuptools python-wheel)
checkdepends=(python-pytest python-matplotlib python-meshio python-h5py python-autograd)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('dad67b8d0a94e5efcd2a8775ea0d5e09d3aeb4249139ebc6b0c2d8aa78c11c16ecd5fc84050afe7db5de6aa1a863f41b54356ddf8b19c494cf6b08fd2952941c')

build() {
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
