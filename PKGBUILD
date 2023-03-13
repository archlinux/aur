# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-deckgl
pkgname=python-${_base}
pkgdesc="Deck.gl widget for trame"
pkgver=2.0.2
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(MIT)
depends=(python-trame-client)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c5b0529126d02c8bf768ad90187aba47d6a3a2f7e3555d6a69184f127779b45567201ecda187ca6805eb0de1802c42426fa8f539f9d12b31f9233fe494a083c5')

prepare() {
  sed -i 's/recursive-include/#recursive-include/' ${_base}-${pkgver}/MANIFEST.in
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
