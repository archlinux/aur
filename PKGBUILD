# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=npx
pkgname=python-${_base}
pkgdesc="Some useful extensions for NumPy"
pkgver=0.0.19
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=('custom')
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('f663cff8b5e0ef614ee7bd9721182b7508ad285de4f3bba3ba2c1d22663d0cca93f44f265668738a71123f4f7a48fdb0d9a1d2e9ff8c858ae6e7d25a05808241')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
