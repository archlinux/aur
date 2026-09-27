# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
# Contributor: Fabian Niepelt <Takios at github dot com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

_pkgname="download-with-kget"
pkgname="${_pkgname}-native-git"
pkgver=r9.dee199a
pkgrel=1
pkgdesc="KGet extension native handler"
arch=('any')
url="https://github.com/Takios/download-with-kget"
license=('MPL-2.0')
depends=(
  'python'
  'python-pydbus'
)
makedepends=('git' 'jq')
provides=("$_pkgname")
source=("git+https://github.com/Takios/download-with-kget")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname" || exit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}/src/native" || exit
  cat <<<"$(jq '.path = "/usr/bin/download_with_kget"' download_with_kget.json)" >download_with_kget.json
}

package() {
  cd "${_pkgname}/src/native" || exit
  install -Dm644 download_with_kget.json -t "${pkgdir}/usr/lib/mozilla/native-messaging-hosts"
  install -Dm644 download_with_kget.json -t "${pkgdir}/usr/lib/librewolf/native-messaging-hosts"
  mkdir -p "${pkgdir}/usr/bin"
  cp download_with_kget.py "${pkgdir}/usr/bin/download_with_kget"
  chmod 755 "${pkgdir}/usr/bin/download_with_kget"
}
