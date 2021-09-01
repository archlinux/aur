# Maintainer: dreieck

_pkgname=ddplan
pkgname="${_pkgname}-git"
pkgver=0.1.0+r7.20160821.5d5d9d8
pkgrel=1
pkgdesc="Simple menubar application with timetables for trams, buses and trains in Dresden. (Dresdner Verkehrsbetriebe/ DVB backend.)"
arch=(
  "any"
)
url="https://github.com/4gray/ddplan"
license=(
  'custom: unspecified'
)
depends=(
  # 'angularjs'
  'electron'
)
makedepends=(
  'git'
  'npm'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+git://github.com/4gray/ddplan.git"
  "ddplan.sh"
#   "${install}"
  "license-dummy.txt"
)
sha256sums=(
  'SKIP'
  '0eb044d24824e5d44c15ab275dae7ca85c41d36539ce88e128ce998907661297'
  '4b5dc58a16f4388301ca913765db1a98f3697d5923c81923cfe0971f8e386338'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _ver="$(npm pkg get version | tr -d "[[:space:]]\"',;")"
  _rev="$(git rev-list HEAD --count)"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  if [ -z ${_ver} ]; then
    error "Could not determine version. Aborting."
    return 1
  fi
  printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Fetching additional node.js modules ..."
  npm install --production --cache "${srcdir}/npm-cache"
}

package() {
  cd "${srcdir}/${_pkgname}"

  DESTDIR="${pkgdir}" npm install -g --production --cache "${srcdir}/npm-cache" "${srcdir}/$(npm pack --pack-destination "${srcdir}")"

  install -D -v -m755 "${srcdir}/ddplan.sh" "${pkgdir}/usr/bin/ddplan"

  for _docfile in README.md TODO.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -D -v -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-dummy"
}
