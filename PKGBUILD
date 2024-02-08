# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

_name=TypeScript
_pkgname=typescript
pkgname="${_pkgname}-git"
pkgver=5.1.5.r6696ecd37
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

_parse_ver() {
  local \
    _pkgver="${1}" \
    _out="" \
    _ver \
    _rev \
    _commit
  _ver="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $1}')"
  _rev="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $2}')"
  _commit="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $3}')"
  _out=${_ver}
  if [[ "${_rev}" != "" ]]; then
    _out+=".r${_rev}"
  fi
  if [[ "${_commit}" != "" ]]; then
    _out+=".${_commit}"
  fi
  echo \
    "${_out}"
}

pkgver() {
  local \
    _pkgver
  cd \
    "${_name}"
  _pkgver="$( \
    git \
      describe \
      --tags | \
      sed \
        's/-/+/g')"
  if [ "${_pkgver}" = "" ]; then
    echo "${pkgver}.r$(git describe --tags --always)"
  else
  _parse_ver \
    "${_pkgver}"
  fi 
}

prepare() {
  cd \
    "${_name}"
  npm \
    ci
}

build() {
  cd \
    "${_name}"
  npx \
    hereby \
      LKG
}

check() {
  cd \
    "${_name}"
  npm \
    run \
      test
}

package() {
  install \
    -d \
    "${pkgdir}/usr/"{bin,"lib/node_modules/${_pkgname}"}
  ln \
    -s \
    "../lib/node_modules/${_pkgname}/bin/"{tsc,tsserver} \
    "${pkgdir}/usr/bin"

  cd \
    "${_name}"
  rsync \
    -r \
    --exclude \
    .gitattributes \
    README.md \
    SECURITY.md \
    bin \
    lib \
    package.json \
    "${pkgdir}/usr/lib/node_modules/${_pkgname}"
  install \
    -Dt \
    "${pkgdir}/usr/share/licenses/${_pkgname}" \
    ThirdPartyNoticeText.txt
}

# vim:set sw=2 sts=-1 et:
