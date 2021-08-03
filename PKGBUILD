_base=cplot
pkgname=python-${_base}
pkgdesc="Color maps for complex-valued functions"
pkgver=0.4.1
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-colorio)
makedepends=(python-setuptools)
checkdepends=(python-tox)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0bd7d443159560b46ed108950bb52d983aae0a1342e8d6259fe266033b412ae2ce786989597fd5fc0c2b267957521c66c0c742b1e786645c4970d7fd5cb1f850')

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
