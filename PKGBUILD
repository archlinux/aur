# Maintainer: dreieck
# Contributer: Brian "Beej" Hall <beej@beej.us>
# Contributer: Raphael Dümig <raphael[AT]duemig-neufahrn[DOT]de>

_pkgname=ffgo
pkgname="${_pkgname}"
pkgver=1.12.8
pkgrel=2
pkgdesc="A graphical launcher for FlightGear, i.e., a program whose purpose is to allow easy assembling and running of an fgfs command line. (Fork of and replacement for 'FGo!'.)"
arch=('any')
url="http://frougon.net/projects/FFGo/"
# Git repository: https://github.com/frougon/FFGo
license=('custom')
depends=(
  'flightgear'
  'python>=3.4'
  'python-condconfigparser'
  'python-geographiclib'
  'python-pillow'
  'tk>=8.5'
)
makedepends=(
  "gettext"
  "imagemagick"
  "librsvg"
  "python-build"
  "python-installer"
  "python-setuptools"
  "python-sphinx"
  "python-wheel"
)
optdepends=(
  # "python-geographiclib:  For more accurate location calculations."
  "geographiclib:  For 'MagneticField' executable. (Seems not to work out of the box, though!)"
  # "python-pillow"
)
source=(
  "FFGo-${pkgver}.tar.gz::http://frougon.net/projects/FFGo/dist/${pkgver}/python3-FFGo-${pkgver}.tar.gz"
  "FFGo-${pkgver}.tar.gz.sig::http://frougon.net/projects/FFGo/dist/${pkgver}/python3-FFGo-${pkgver}.tar.gz.asc"
)
sha256sums=(
  'caef1eb8fd9d51215564eedc994586adcb9d08cc24c3481118e7685661f11e2b'
  '803d268d5c5b2a49321c94e7951aa095035907cec1a3a204386959e0b451928d'
)
validpgpkeys=(
  '125B5A0FDB788FDD0EF41A9DC785B90B5053A3A2'
)

build() {
  cd "${srcdir}/FFGo-${pkgver}"
  printf '%s\n' "${url}" > "upstream.url"

  make icons update-po update-mo update-pot doc
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/FFGo-${pkgver}"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  for _docfile in upstream.url ChangeLog ChangeLog.FGo PKG-INFO README.rst; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgname}/docs"

  install -D -v -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
