# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=scipyx
pkgname=python-${_base}
pkgdesc="SciPy fixes and extensions"
pkgver=0.0.15
pkgrel=2
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(BSD)
depends=(python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-tox)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1527c6b4fb0c7e17e085d9d6907549053559241cad5608ac9df80ade8e26def4bba917fa91addabd479eaf58ee97df6d2214526e01f1fdd803c201c37a4a3bf3')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  tox -e py$(python -c "import sys; print(sys.version[:3].replace('.', ''))")
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1
  rm -r "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/${_base}/__pycache__"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
