# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scikit-fem
pkgname=python-${_base}
pkgdesc="Simple finite element assemblers"
pkgver=4.0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/kinnala/${_base}"
license=('custom:BSD-3-clause')
depends=(python-scipy python-meshio)
makedepends=(python-setuptools python-pip)
checkdepends=(python-pytest python-matplotlib python-pacopy python-pyamg python-h5py)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('0d82469b085a7d0a40af09b749a8012d30a217988cf87ad68c2631b5869031e1878fa8092bb21de5aeb2e2be0190653ca8f66f10b0c24ae014cc42b54a4b77fa')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
