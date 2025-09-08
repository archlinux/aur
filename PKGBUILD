# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2025-09-08.

_gitname=openflights
_pkgname="${_gitname}-data"
pkgname="${_pkgname}-git"
epoch=0
_pkgver=latest
pkgver=r35.20200131
pkgrel=2
pkgdesc="Airport, train station, ferry terminal, airline and flight routes data as CSV files to be used e.g. in GIS-applications."
arch=(any)
url="http://openflights.org/data"
license=(
  'ODbL-1.0'
  'LicenseRef-DbCL-1.0'
)

groups=(
  "openflights"
)

depends=()
makedepends=(
 'git'
)
replaces=(
  "${_pkgname}-latest"
)
optdepends=()

provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  "${_gitname}::git+https://github.com/jpatokal/openflights.git"
  "info.html::http://openflights.org/data"
  "License_ODbL_1.0.html::http://opendatacommons.org/licenses/odbl/1.0/"
  "License_DbCL_1.0.html::http://opendatacommons.org/licenses/dbcl/1.0/"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_gitname}"

  git log data/*.dat > git.log

  echo "${url}" > "info.url"
}

pkgver() {
  cd "${srcdir}/${_gitname}"

  _rev="$(git rev-list --count HEAD data/*.dat)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad" data/*.dat)"

  if [ -z "${_rev}" ]; then
    error "Could not determine git commit count of 'data/*.dat'."
    return 1
  else
    printf '%s' "r${_rev}.${_date}"
  fi
}

package() {
  _instdirbase='/opt/openflights-data'
  _instdir="${pkgdir}/${_instdirbase}"
  _docdirbase="/usr/share/doc/${_pkgname}"
  _docdir="${pkgdir}/${_docdirbase}"
  _licensedirbase="/usr/share/licenses/${pkgname}"
  _licensedir="${pkgdir}/${_licensedirbase}"

  cd "${srcdir}/${_gitname}"


#   "https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat"
#   "https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports-extended.dat"
#   "https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports-dafif.dat"
#   "https://raw.githubusercontent.com/jpatokal/openflights/master/data/airlines.dat"
#   "https://raw.githubusercontent.com/jpatokal/openflights/master/data/routes.dat"
#   "https://raw.githubusercontent.com/jpatokal/openflights/master/data/countries.dat"
#   "https://raw.githubusercontent.com/jpatokal/openflights/master/data/locales.dat"

  install -Dvm644 -t "${_instdir}" "data"/*.dat

  install -Dvm644 -t "${_docdir}" "${srcdir}/info.html"
  install -Dvm644 -t "${_docdir}" git.log info.url

  install -Dvm644 -t "${_licensedir}" "${srcdir}"/License_{ODbL,DbCL}_1.0.html
}
