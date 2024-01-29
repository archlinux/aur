# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

_py="python2"
_pkg="tornado"
_proj="${_pkg}web"
pkgname="${_py}-${_pkg}"
pkgver=5.1.1
pkgrel=3
_pkgdesc=(
  'open source version of the scalable,'
  'non-blocking web server and tools'
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'x86_64'
  'i686'
  'pentium4'
  'arm'
  'armv7h'
  'aarch64'
  'mips'
)
url="https://www.${_proj}.org"
license=(
  'Apache'
)
depends=(
  "${_py}-futures"
  "${_py}-singledispatch"
  "${_py}-backports-abc"
)
optdepends=(
  "${_py}-monotonic: enable support for a monotonic clock"
  "${_py}-pycurl: for ${_pkg}.curl_httpclient"
  "${_py}-twisted: for ${_pkg}.platform.twisted"
  # "${_py}-pycares: an alternative non-blocking DNS resolver"
)
makedepends=(
  "${_py}-setuptools"
)
checkdepends=(
  "${_py}-pycurl"
  "${_py}-mock"
  "${_py}-twisted"
  "${_py}-trollius"
  "${_py}-monotonic"
)
provides=(
  "${_pkg}=${pkgver}"
  "${_pkg}2=${pkgver}"
)
conflicts=(
  "${_pkg}=${pkgver}"
  "${_pkg}2=${pkgver}"
)
_ns="${_proj}"
_http="https://github.com"
source=(
  "$pkgname-$pkgver.tar.gz::${_http}/${_ns}/${_pkg}/archive/v${pkgver}.tar.gz"
)
sha512sums=(
  'b35fa0687ede6e672c35ca82fcc01dbb2ae9d8a7f2e4a65b6e07aa5a8eca861a22d775101172b7e33564951d193e5f11887021a3d762bee88668b9ac0069ab46'
)

export \
  TORNADO_EXTENSION=1

prepare() {
  # python -> python2 rename
  find \
    "${_pkg}-${pkgver}" \
    -name '*py' \
    -exec \
      sed \
        -e 's_#!/usr/bin/env python_&2_' \
        -i \
        {} \;
}

build() {
  cd \
    "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      build
}

check() {
  # As of 4.5.3, ignoring test failures about resolving "localhost"
  (
    cd \
      "${_pkg}-${pkgver}"
    "${_py}" \
      setup.py \
        install \
          --root="$PWD/tmp_install" \
          --optimize=1
    export \
      PYTHONPATH="$PWD/tmp_install/usr/lib/python2.7/site-packages:$PYTHONPATH"
    cd tmp_install
    "${_py}" \
      -m \
        "${_pkg}.test.runtests"
    "${_py}" \
      -m \
        "${_pkg}.test.runtests" \
        --ioloop="${_pkg}.platform.select.SelectIOLoop"
    "${_py}" \
      -m \
        "${_pkg}.test.runtests" \
        --httpclient="${_pkg}.curl_httpclient.CurlAsyncHTTPClient"
    "${_py}" \
      -m \
        "${_pkg}.test.runtests" \
      --ioloop_time_monotonic
    "${_py}" \
      -m \
        "${_pkg}.test.runtests" \
      --ioloop="${_pkg}tornado.platform.twisted.TwistedIOLoop"
    "${_py}" \
      -m \
        "${_pkg}.test.runtests" \
        --ioloop="${_pkg}.platform.asyncio.AsyncIOLoop"
    "${_py}" \
      -m \
        "${_pkg}.test.runtests" \
        --resolver="${_pkg}.netutil.ThreadedResolver"
  ) || \
    echo \
      "Tests failed"
}

package() {
  cd "${_pkg}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1
}

# vim:set sw=2 sts=-1 et:
