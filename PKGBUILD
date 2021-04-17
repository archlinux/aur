# Maintainer: dreieck
# Contributer: Brian "Beej" Hall <beej@beej.us>
# Contributer: Raphael Dümig <raphael[AT]duemig-neufahrn[DOT]de>

_pkgname=ffgo
pkgname="${_pkgname}-git"
pkgver=1.12.7+r593.20200602.ee50e77
pkgrel=3
pkgdesc="A graphical launcher for FlightGear, i.e., a program whose purpose is to allow easy assembling and running of an fgfs command line. (Fork of and replacement for 'FGo!'.)"
arch=('any')
url="http://frougon.net/projects/FFGo/"
# Git repository: https://github.com/frougon/FFGo
license=('custom')
depends=(
  'flightgear'
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
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+git://github.com/frougon/FFGo.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _rev="$(git rev-list HEAD --count)"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  cd ffgo
  _ver="$(python -c 'import version; print(version.__version__)')"
  if [ -z ${_ver} ]; then
    error "Could not determine version."
    exit 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' "${url}" > "upstream.url"

  make icons update-po update-mo update-pot doc
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  for _docfile in upstream.url ChangeLog ChangeLog.FGo README.rst; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgname}/docs"

  install -D -v -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
