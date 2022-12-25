# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=tryton
pkgname=python-${_base}
pkgver=6.6.1
pkgrel=2
pkgdesc="Tryton desktop client"
arch=(any)
url="https://${_base}.org"
license=(GPL3)
depends=(python-cairo python-dateutil python-gobject)
makedepends=(python-setuptools)
optdepends=('python-goocalendar: calendar support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a05a06488eb830e6d710ef00c93f384a9773b676333f865d2cee1a5a172ae08f62f4fa84ed078003cd2535ea892532a2348de78d7e23c142497d2e4a3e2d55eb')
provides=(${_base})
conflicts=(${_base})

prepare() {
  cd ${_base}-${pkgver}
  # https://foss.heptapod.net/tryton/tryton/-/issues/10777
  sed -i 's/^            record.destroy()/            # record.destroy()/' ${_base}-${pkgver}/tryton/gui/window/view_form/model/group.py
  sed -i '140 a \ \ \ \ \ \ \ \ \ \ \ \ record.destroy()' ${_base}-${pkgver}/tryton/gui/window/view_form/model/group.py
}

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 ${_base}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 ${_base}/data/pixmaps/${_base}/${_base}-icon.png "${pkgdir}/usr/share/pixmaps/${_base}-icon.png"
}
