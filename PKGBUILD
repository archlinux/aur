# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pacopy
pkgname=python-${_base}
pkgdesc="Numerical parameter continuation in Python"
pkgver=0.1.9
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-rich)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks python-pyfvm python-krylov python-meshzoo python-cplot python-h5py)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('963e91b3fda0e7ed8d75258d4ad50e9740c6b4066a19c1301d3547d4efd4adeece98997974d3855975411fbc3b907e4684ba7a121fff9a3cee5e53e72f13937c')

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
