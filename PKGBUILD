# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Maintainer: graysky <graysky AT archlinux DOT us>
_base=matplotx
pkgname=python-${_base}
pkgdesc="Useful styles and extensions for Matplotlib"
pkgver=0.3.10
pkgrel=1
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-matplotlib)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-imageio python-networkx python-pypng)
optdepends=('python-networkx: for creation of graphs'
  'python-pypng: for iterator support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('33eea6fe855915b45c490c02ce4fb45fecdae9e090e9ff1438620d4f898143e0dd27341493124a364d30aca1a39c2da9d3547555a57dcc45dd72144897c825b5')

build() {
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" PYTHONPATH="${PWD}/build/lib/:${PYTHONPATH}" MPLBACKEND=Agg python -m pytest -k 'not cli and not readme_images'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
