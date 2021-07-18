# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=blacktex
pkgname=python-${_base}
pkgdesc="Cleans up your LaTeX files"
pkgver=0.5.1
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-tox)
provides=('blacktex')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ac1422ef403665a57240f74b1aa4c583a8bcd3ea6ebaf87ff62074517e4182c2e8a06e29001b621619253c356b10daa7516dd4db59fb40765eb5bdfa371eb5d9')

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
