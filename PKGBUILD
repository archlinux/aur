# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

_name=TypeScript
_pkgname=typescript
pkgname="${_pkgname}-git"
pkgver=5.1.5+6696ecd37
pkgrel=1
pkgdesc='JavaScript with syntax for types'
arch=('any')
url="http://www.${_pkgname}lang.org"
license=('Apache')
depends=('nodejs')
makedepends=(
  'npm'
  'rsync')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  # This source tree is very large
  "git+https://github.com/microsoft/${_name}"
  # "git+ssh://git@github.com/microsoft/${_name}"
  # "${_name}::git+file:///tmp/${_name}.git"
 )
b2sums=(
  'SKIP')

pkgver() {
  local _pkgver
  cd "${_name}"
  _pkgver="$(git describe --tags | sed 's/-/+/g')"
  if [ "${_pkgver}" = "" ]; then
    echo "${pkgver}+$(git describe --tags --always)"
  fi 
}

prepare() {
  cd "${_name}"
  npm ci
}

build() {
  cd "${_name}"
  npx hereby LKG
}

check() {
  cd "${_name}"
  npm run test
}

package() {
  install -d "${pkgdir}/usr/"{bin,"lib/node_modules/${_pkgname}"}
  ln -s "../lib/node_modules/${_pkgname}/bin/"{tsc,tsserver} "${pkgdir}/usr/bin"

  cd "${_name}"
  rsync -r --exclude .gitattributes README.md SECURITY.md bin lib package.json \
        "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  install -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" ThirdPartyNoticeText.txt
}
