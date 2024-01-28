# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_pkg="autocommand"
_py='python'
_pkgbase="${_py}-${_pkg}"
pkgbase="${_pkgbase}-git"
pkgname=(
  "${pkgbase}"
)
pkgver="2.2.2.r7.gacff23e"
pkgrel=4
pkgdesc="A library to create a command-line program from a function"
_ns="Lucretiel"
_http="https://github.com"
url="${_http}/${_ns}/${_pkg}"
license=(
  'LGPL'
)
arch=(
  'any'
)
depends=(
  "${_py}"
)
makedepends=(
  'git'
  "${_py}-build"
  "${_py}-installer"
  "${_py}-setuptools"
)
checkdepends=(
  "${_py}-pytest"
)
provides=(
  "${_pkgbase}=${pkgver}"
)
conflicts=(
  "${_pkgbase}"
)

source=(
  "${_pkg}::git+${url}.git"
)
sha512sums=(
  SKIP
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
    "${_pkg}" || \
    exit
  _pkgver="$( \
    git \
      describe \
      --tags | \
        sed \
          's/_/./g;s/-/+/g')"
  _parse_ver \
    "${_pkgver}"
}

build() {
  cd \
    "${_pkg}"
  cat \
    "setup.py"
  "${_py}" \
    -m \
    build \
      --wheel \
      --skip-dependency-check \
      --no-isolation
}

check() {
  cd \
    "${_pkg}"
  PYTHONPATH="$PWD"/build/lib \
    pytest
}

package() {
  cd \
    "${_pkg}"
  "${_py}" \
    -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl
}

# vim:set sw=2 sts=-1 et:
