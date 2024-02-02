# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_py="python2"
_pkg="brotli"
_pkgbase="${_pkg}"
pkgbase="${_py}-${_pkg}"
pkgname=(
  "${pkgbase}"
)
# 1.1.0
_gitcommit="ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
# 1.0.9
_gitcommit="e61745a6b7add50d380cfd7d3883dd6c62fc2c71"
pkgver=1.0.9
pkgrel=1
_pkgdesc=(
  'Generic-purpose lossless'
  'compression algorithm'
)
pkgdesc="${_pkgdesc[*]}"
_http="https://github.com"
_ns="google"
url="${_http}/${_ns}/${_pkg}"
arch=(
  'x86_64'
  'arm'
  'aarch64'
  'i686'
  'mips'
  'pentium4'
  'powerpc'
  'armv7h'
  'armv6l'
)
license=(
  'MIT'
)
makedepends=(
  git
  cmake
  "${_py}-setuptools"
  "${_py}-wheel"
)
source=(
  ${_pkg}::"git+${url}#commit=${_gitcommit}"
)
sha512sums=(
  'SKIP'
)

pkgver() {
  cd \
    "${_pkg}"
  git \
    describe \
      --tags \
      --match \
        'v*' | \
        sed \
          's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local \
    _cflags=()
  _cflags=(
    "-Wno-register"
    "${CFLAGS}"
  )
  cd \
    "${_pkg}"
  ls
  CFLAGS="${_cflags[*]}" \
    "${_py}" \
      setup.py \
        build
}

check() {
  cd \
    "${_pkg}"
  local \
    _pyver
  _pyver="$( \
    "${_py}" \
      -c \
        'import sys; print("".join(map(str, sys.version_info[:2])))')"
  PYTHONPATH="$PWD/bin/lib.linux-${CARCH}-cpython-${_pyver}" \
    "${_py}" \
    -m \
      unittest \
      discover \
        "${_py}" \
          "*_test.py"
}

package_python2-brotli() {
  pkgdesc+=' - Python 2 library'
  depends=(
    "${_py}"
  )
  cd \
    "${_pkg}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}"
  install \
    -Dm \
      644 \
    LICENSE \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgbase}"
}

# vim:set sw=2 sts=-1 et:
