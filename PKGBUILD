# Maintainer: dreieck

_pkgname="qhuaweiflash"
pkgname="${_pkgname}-git"
pkgver=r143.20190905.54ec963
pkgrel=2
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
  'helpmessages_english.md'
)
sha256sums=(
  'SKIP'
  '6deccd04bd2b86b115cbb9ed698fcfbf9f0ae9bae56862e160d90d1cde63cbc3'
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
