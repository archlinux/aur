# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer:  Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Bambang Catur Pamungkas <bambangcaturz@gmail.com>

_proj="sentry"
_pkg="cli"
_pkgname="${_proj}-${_pkg}"
pkgname="${_pkgname}-git"
pkgver=2.20.6
pkgrel=1
pkgdesc="A command line utility to work with Sentry"
arch=(
  'x86_64'
  'arm'
  'aarch64'
  'mips'
  'armv7h'
)
url="https://docs.${_proj}.io/${_pkg}"
license=(
  'BSD'
)
depends=(
  'gcc-libs'
  'bzip2'
  'zlib'
)
makedepends=(
  'cargo'
)
options=(
  '!lto'
)
_http="https://github.com"
_ns="get${_proj}"
_url="${_http}/${_ns}/${_pkgname}"
source=(
  "${_pkgname}::git+${_url}/archive/${pkgver}.tar.gz"
)
sha256sums=(
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
    "${_pkgname}"
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
    "${_pkgname}"
  cargo \
    build \
      --release \
      --locked
}

package() {
  cd \
    "${_pkgname}"
  install \
    -Dm755 \
    "target/release/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install \
    -Dm644 \
    LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
