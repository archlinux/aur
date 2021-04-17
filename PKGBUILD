# Maintainer: dreieck
# Contributer: Brian "Beej" Hall <beej@beej.us>
# Contributer: Raphael Dümig <raphael[AT]duemig-neufahrn[DOT]de>

_pkgname=ffgo
pkgname="${_pkgname}"
pkgver=1.12.7
pkgrel=2
pkgdesc="A graphical launcher for FlightGear, i.e., a program whose purpose is to allow easy assembling and running of an fgfs command line. (Fork of and replacement for 'FGo!'.)"
arch=('any')
url="http://frougon.net/projects/FFGo/"
# Git repository: https://github.com/frougon/FFGo
license=('custom')
depends=(
  'python>=3.4'
  'python-condconfigparser'
  'tk>=8.5'
)
makedepends=(
  "gettext"
  "imagemagick"
  "librsvg"
  "python-setuptools"
  "python-sphinx"
)
optdepends=(
  "geographiclib"
  "python-geographiclib"
  "python-pillow"
)
source=(
  "FFGo-${pkgver}.tar.gz::http://frougon.net/projects/FFGo/dist/${pkgver}/python3-FFGo-${pkgver}.tar.gz"
  "FFGo-${pkgver}.tar.gz.sig::http://frougon.net/projects/FFGo/dist/${pkgver}/python3-FFGo-${pkgver}.tar.gz.asc"
)
sha256sums=(
  '313c657e56e2cb7c291aa56a0c11f98682eae7bdddd787075b872c1eda4792a4'
  '57e4829a5c92e0563161cd9b70825f1104f5667b1e675c8381d56d03edf4d969'
)
validpgpkeys=(
  '125B5A0FDB788FDD0EF41A9DC785B90B5053A3A2'
)

build() {
  cd "${srcdir}/FFGo-${pkgver}"
  printf '%s\n' "${url}" > "upstream.url"

  make icons update-po update-mo update-pot doc
  python setup.py build
}

package() {
  cd "${srcdir}/FFGo-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  for _docfile in upstream.url ChangeLog ChangeLog.FGo PKG-INFO README.rst; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgname}/docs"

  install -D -v -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
