# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributer: Allan McRae <allan@archlinux.org>

_py="python"
_pkg="six"
_pkgname="${_py}-${_pkg}"
pkgbase="${_pkgname}-git"
pkgname=(
  "${pkgbase}"
)
pkgver="1.16.0.r7.g02c3bca"
pkgrel=1
pkgdesc="Python 2 and 3 compatibility utilities"
arch=(
  'any'
)
url="https://pypi.python.org/pypi/six/"
license=(
  'MIT'
)
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
checkdepends=(
  "${_py}-pytest"
  'tk'
)
_http="https://github.com"
_ns="benjaminp"
_url="${_http}/${_ns}/${_pkg}"
source=(
  "${_pkg}::git+${_url}.git"
)
sha512sums=(
  'SKIP'
)

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
  [[ "${_rev}" != "" ]] && \
    _out+=".r${_rev}"
  [[ "${_commit}" != "" ]] && \
    _out+=".${_commit}"
  echo \
    "${_out}"
}

pkgver() {
  local \
    _pkgver
  cd \
    "${_pkg}"
  _pkgver="$( \
    git \
      describe \
      --tags | \
      sed \
        's/-/+/g')"
  _parse_ver \
    "${_pkgver}"
}

check() {
  cd \
    "${_pkg}"
  "${_py}" \
    -m \
      pytest
}

package() {
  cd \
    "${_pkg}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1
  install \
    -Dm644 \
    LICENSE \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ft=sh syn=sh et
