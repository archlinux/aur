# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-markdown
pkgname=python-${_base}
pkgdesc="Markdown widget for trame"
pkgver=2.0.2
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(MIT)
depends=(python-trame-client)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a1a1177ad1f1c55a3afeccf4c7f682dc08ff744eb1f6843f1085d5889a7c5853cfe2b292e46d420014c3ce6489bd2ffa05b8c6c704d988993de33b2d117dbde0')

prepare() {
  sed -i 's/graft/#graft/' ${_base}-${pkgver}/MANIFEST.in
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
