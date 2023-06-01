# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=tryton
pkgname=python-${_base}
pkgver=6.8.1
pkgrel=1
pkgdesc="Tryton desktop client"
arch=(any)
url="https://${_base}.org"
license=(GPL3)
depends=(python-cairo python-dateutil python-gobject)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-goocalendar: calendar support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('667152caeeafe3cff8f6df8300703ab0b82c33d9a123c54ae575aec620818af05387d72ab648837269fe5a627f22d8183e5087e261cab45acffade28bda7777e')
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
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 ${_base}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 ${_base}/data/pixmaps/${_base}/${_base}-icon.png "${pkgdir}/usr/share/pixmaps/${_base}-icon.png"
}
