# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scikit-fem
pkgname=python-${_base}
pkgdesc="Simple finite element assemblers"
pkgver=6.0.0
pkgrel=1
arch=('x86_64')
url="https://github.com/kinnala/${_base}"
license=('custom:BSD-3-clause')
depends=(python-scipy)
makedepends=(python-setuptools python-wheel)
checkdepends=(python-pytest python-matplotlib python-pacopy python-h5py python-meshio python-pyamg)
optdepends=('python-meshio: for import/export any mesh format')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('dd61c4a00711b2628efcf718aca5bf3cf696002db910d39fc2c8ea4d351556ce512f09ab18aedcb1ddf78ed4d036b77008b8f8f923bc6c6cb468eb751d8b250a')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest -k 'not Ex23'
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
