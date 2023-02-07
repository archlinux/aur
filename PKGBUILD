# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=tryton
pkgname=python-${_base}
pkgver=6.6.4
pkgrel=1
pkgdesc="Tryton desktop client"
arch=(any)
url="https://${_base}.org"
license=(GPL3)
depends=(python-cairo python-dateutil python-gobject)
makedepends=(python-setuptools)
optdepends=('python-goocalendar: calendar support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('081e3140a07811c346f4b8ab7b14b2f99a25c572d6921c7d5b8bdd4dd3cfeb459c7445b7e678d57130f5c53cee82185b75a34578aaf5bd44a95e34468195ddc5')
provides=(${_base})
conflicts=(${_base})

prepare() {
  cd ${_base}-${pkgver}
  # https://foss.heptapod.net/tryton/tryton/-/issues/10777
  sed -i 's/^            record.destroy()/            # record.destroy()/' tryton/gui/window/view_form/model/group.py
  sed -i '140 a \ \ \ \ \ \ \ \ \ \ \ \ record.destroy()' tryton/gui/window/view_form/model/group.py
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
