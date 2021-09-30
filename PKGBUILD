# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
_base=npx
pkgname=python-${_base}
pkgdesc="Some useful extensions for NumPy"
pkgver=0.0.20
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=('custom:BSD-3-clause')
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('03e991d0539bef815ad144cbfe3582df0648f5a963e72a15332c84673ba26a180990a27c5d43a7a8744b4896fd8ced44e6e225dc6b5ece41a669fc434c122b9c')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
  cd "${pkgdir}/$(python -c "import site; print(site.getsitepackages()[0])")/${_base}"
  rm -r "__pycache__"
  cd "${srcdir}/${_base}-${pkgver}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
