# SPDX-License-Identifier: AGPL-3.0
#
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer:  Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_py="python"
_pkg="rich"
_pkgbase="${_py}-${_pkg}"
pkgbase="${_pkgbase}-git"
pkgname=(
  "${pkgbase}"
)
pkgver=13.7.0
pkgrel=1
_pkgdesc=(
  'Render rich text, tables, progress bars,'
  'syntax highlighting, markdown and more to the terminal'
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  any
)
_ns="willmcgugan"
_http="https://github.com"
url="${_http}/${_ns}/${_pkg}"
license=('MIT')
depends=(
  "${_py}-"{colorama,markdown-it-py,pygments}
)
makedepends=(
  "git"
  "${_py}-"{build,installer,poetry-core,wheel}
)
provides=(
  "${pkgbase}=${pkgver}"
  "${_pkg}-git=${pkgver}"
  "${_pkg}=${pkgver}"
)
conflicts=(
  "${pkgbase}"
  "${_pkg}-git"
  "${_pkg}"
)
source=(
  "git+${url}.git"
)
b2sums=(
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

build() {
  cd \
    "${_pkg}"
  python \
    -m \
      build \
    --wheel \
    --no-isolation
}

package() {
  cd \
    "${_pkg}"
  "${_py}" \
    -m \
      installer \
      --destdir="${pkgdir}" \
      dist/*.whl
  install \
    -Dm644 \
    LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE
}

# vim:set sw=2 sts=-1 et:
