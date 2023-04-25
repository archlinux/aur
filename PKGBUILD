# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame
pkgname=python-${_base}
pkgdesc="Framework to build applications in plain Python"
pkgver=2.4.0
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(Apache)
depends=(python-trame-server python-trame-client python-trame-router python-trame-components python-trame-plotly python-trame-markdown python-trame-matplotlib python-trame-deckgl python-trame-vega python-trame-vuetify python-trame-vtk python-trame-simput python-trame-rca)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9dd35833066acc07ec432dda7480e637a55171511e19e936ed20ce4a04b46fb5015b48f2dc4dfa91a591cbb7546ba0bbda60fd2963081f0da40685855662fb0f')

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
