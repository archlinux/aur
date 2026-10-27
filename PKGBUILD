# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: Michael Kuc <michaelkuc6 at gmail dot com>
# Contributor: Fabian Niepelt <Takios at github dot com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

_pkgname="download-with-kget"
pkgname="${_pkgname}-native-git"
pkgver=r9.dee199a
pkgrel=2
pkgdesc="KGet extension native handler"
arch=('any')
url="https://github.com/Takios/download-with-kget"
license=('MPL-2.0')
depends=(
  'python'
  'python-pydbus'
  'kget'
)
makedepends=('git' 'jq')
provides=("$_pkgname")
source=("git+https://github.com/Takios/download-with-kget")
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname" || exit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}/src/native" || exit
  jq '.path = "/usr/bin/download_with_kget"' download_with_kget.json >download_with_kget.json.new
  mv download_with_kget.json.new download_with_kget.json
}

package() {
  cd "${_pkgname}/src/native" || exit
  install -Dm644 download_with_kget.json -t "${pkgdir}/usr/lib/mozilla/native-messaging-hosts"
  install -Dm644 download_with_kget.json -t "${pkgdir}/usr/lib/librewolf/native-messaging-hosts"
  install -Dm755 download_with_kget.py "${pkgdir}/usr/bin/download_with_kget"
}
