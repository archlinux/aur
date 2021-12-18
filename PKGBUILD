# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pacopy
pkgname=python-${_base}
pkgdesc="Numerical parameter continuation in Python"
pkgver=0.1.7
pkgrel=2
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks python-cplot python-krylov python-meshzoo python-pyfvm)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e0bd26f05a97b1e2d113bdee508ca82d9624904e1d46555bf442748ccc2d294bc856f0d0b1489482dfd595658dfe17e7ae3b6a65dc816bbde061168ac9ee1b69')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
