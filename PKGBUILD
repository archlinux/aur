# Maintainer: dreieck

_pkgname="qhuaweiflash"
pkgname="${_pkgname}-git"
pkgver=r143.20190905.54ec963
pkgrel=1
pkgdesc='Graphic utility for flashing HUAWEI modems and routers and editing firmware files (GUI is in russian only).'
arch=('i686' 'x86_64')
url="https://github.com/forth32/${_pkgname}"
license=('GPL3')
depends=(
  'qt5-base'
)
makedepends=(
  'git'
)
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
  "${_pkgname}::git+https://github.com/forth32/${_pkgname}.git"
  'helpmessages_english.md'::"http://ix.io/3Znx"
)
sha256sums=(
  'SKIP'
  '816e0028dcb780c9749618c4ac294a4809b9f45e468dcc0cfc75e392db2d4d9e'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  qmake
  make -j"$(nproc)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  for _binary in 'qhuaweiflash'; do
    install -D -v -m755 "${_binary}" "${pkgdir}/usr/bin/${_binary}"
  done

  for _docfile in 'README.md' "${srcdir}/helpmessages_english.md"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
}
