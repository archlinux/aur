# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributer: Brian "Beej" Hall <beej@beej.us>
# Contributer: Raphael Dümig <raphael[AT]duemig-neufahrn[DOT]de>

_pkgname=ffgo
pkgname="${_pkgname}-git"
pkgver=1.12.8.r601.20230917.f5624be
pkgrel=4
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
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+https://github.com/frougon/FFGo.git"
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
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' "${url}" > "upstream.url"

  make icons update-po update-mo update-pot doc
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  for _docfile in upstream.url ChangeLog ChangeLog.FGo README.rst; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgname}/docs"

  install -D -v -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
