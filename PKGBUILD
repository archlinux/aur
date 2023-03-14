# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-matplotlib
pkgname=python-${_base}
pkgdesc="Matplotlib widget for trame"
pkgver=2.0.2
pkgrel=2
arch=(any)
url="https://github.com/Kitware/${_base}"
license=('custom:BSD-3-clause')
depends=(python-trame-client)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2758400fe658697dbb27eb4f2e0cb0acbe7116e912ca69f2d472fdeb129f8f243c51613e2d588f395ccd5cf070297df4546e1323e220ca419d716173540c0de2')

prepare() {
  sed -i 's/include/#include/' ${_base}-${pkgver}/MANIFEST.in
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
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
