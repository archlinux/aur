# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-vuetify
pkgname=python-${_base}
pkgdesc="Vuetify widgets for trame"
pkgver=2.2.4
pkgrel=2
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(MIT)
depends=(python-trame-client)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-trame-server)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8fc62453701d97b13b14984bd5c7a5611246aed39192cc4b749f997e1063225c8eaf4ea7bd9058476f90983fcb5c3a5a05061767a57b564fdaebaf017c47662c')

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
  rm ${pkgdir}${site_packages}/trame/ui/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
