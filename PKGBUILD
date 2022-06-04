# Maintainer: dreieck

_pkgname="balong-fbtools"
pkgname="${_pkgname}-git"
pkgver=r36.20171009.22a228c
pkgrel=2
pkgdesc="Utilities for working with flash modems on the balong platform. Contains 'fbrflash'."
arch=('i686' 'x86_64')
url="https://github.com/forth32/${_pkgname}"
license=('GPL3')
depends=('libusb')
makedepends=('git')
optdepends=()
provides=(
  "${_pkgname}"
  'fbrflash'
  "fbrflash-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  'fbrflash'
)

source=(
  "${_pkgname}::git+https://github.com/forth32/${_pkgname}.git"
  'helpmessages_english.md'::"http://ix.io/3Znm"
)
sha256sums=(
  'SKIP'
  'ab70bd1ab7b324ea73e3225d13500b1ecda7663434a8fa71b5457dd229087440'
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

  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -v -m755 fbrflash "${pkgdir}/usr/bin/fbrflash"

  install -D -v -m644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 "${srcdir}/helpmessages_english.md" "${pkgdir}/usr/share/doc/${_pkgname}/helpmessages_english.md"
}
