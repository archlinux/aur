# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame
pkgname=python-${_base}
pkgdesc="Framework to build applications in plain Python"
pkgver=2.3.2
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache)
depends=(python-trame-server python-trame-client python-trame-router python-trame-components python-trame-plotly python-trame-markdown python-trame-matplotlib python-trame-deckgl python-trame-vega python-trame-vuetify python-trame-vtk python-trame-simput python-trame-rca)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8ba978fe13e7d4d8626813ff5ebfb1c10a3b94edf7be331636d6329b16fa33c5c9da9f49241abf098b4861fdd9cc89b9c36c163823760ed31bd2dc3ca53f2f63')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/MANIFEST.in
}

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/ui/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
