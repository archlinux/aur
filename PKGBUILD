# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
_base=accupy
pkgname=python-${_base}
pkgdesc="Accurate sums and dot products for Python"
pkgver=0.3.5
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-mpmath python-pyfma eigen)
makedepends=(python-setuptools pybind11)
checkdepends=(python-pytest-cov python-perfplot)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('32d0d76eb2b0b6e843cb6a81267c0f54d354fe1ccd812196f14360521f13ccdc62dd2b1dc14739162d4e7d0dbd6bb0521056ac03b8fbb67f4ddaef02b812b779')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
