# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pacopy
pkgname=python-${_base}
pkgdesc="Numerical parameter continuation in Python"
pkgver=0.1.8
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks python-cplot python-krylov python-meshzoo python-pyfvm)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('632ac66b12ae3d48a333e73fb1d369de8c4be627ccc8846a8693ae3a3fda348d4ef9f42f9d77ddc3cde244eaf0b3de84e590dd2ea542c66ee449139b59b6ce7f')

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
