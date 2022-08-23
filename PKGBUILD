# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=cplot
pkgname=python-${_base}
pkgdesc="Plot complex functions"
pkgver=0.9.3
pkgrel=1
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-matplotx python-npx)
makedepends=(python-setuptools)
checkdepends=(python-pytest-codeblocks python-networkx) # python-pyvista openmpi fmt jsoncpp libx11 libxcursor glew
optdepends=('python-pyvista: for create an unstructured grid')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4e18458a20701f673fa67ba0d03c07aabdbe2515e80c05fde1127cc82f345ffb78234c09fa3212f29e0f0725b371a7fc5b43ce35983e9738e6cdb143907fea43')

build() {
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" PYTHONPATH="${PWD}/build/lib/:${PYTHONPATH}" python -m pytest --codeblocks -k 'not README and not riemann'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
