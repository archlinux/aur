# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scikit-fem
pkgname=python-${_base}
pkgdesc="Simple finite element assemblers"
pkgver=5.2.0
pkgrel=1
arch=('x86_64')
url="https://github.com/kinnala/${_base}"
license=('custom:BSD-3-clause')
depends=(python-scipy)
makedepends=(python-setuptools python-pip)
checkdepends=(python-pytest python-matplotlib python-pacopy python-h5py python-meshio python-pyamg)
optdepends=('python-meshio: for import/export any mesh format')
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('380911e1e0af2e0373898a5e40be265d2d0616294d0b4d4166c07a94ef145bb1061d406e1e605eaba724199fc6cc2f1977b75e44563ffb74caa9eb64323a5b0f')

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
