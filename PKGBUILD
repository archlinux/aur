# SPDX-License-Identifier: AGPL-3.0
#
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>

_py="python2"
_pkg="singledispatch"
pkgname="${_py}-${_pkg}"
_name="${_pkg}"
pkgver=3.7.0
pkgrel=3
pkgdesc='Backport of functools.singledispatch from Python 3.4'
arch=(
  'any'
)
url="https://pypi.org/project/${_name}/${pkgver}/"
license=(
  'MIT'
)
depends=(
  "${_py}"
  "${_py}-six"
)
makedepends=(
  "${_py}-setuptools"
)
_tarname="${_name}-${pkgver}"
_ns="jaraco"
_http="https://github.com"
_url="${_http}/${_ns}/${_pkg}"
source=(
  "${_tarname}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=(
  'b488ebea8aeb1055fd91422d0ce7a91f321e3a0b9b99387f936fd1fd95a1016492baeabecfc0fd7ad8988a93c1054ff7681b8c4d0affa2d6114b90b6c8c58bdd'
)

# setuptools-scm won't find version
# from git tag when source is a tarball
export \
  SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

prepare() {
  cd \
    "${_tarname}"
  echo \
    'Changing hashbangs in *.py files to refer to python2'
  sed \
    -e \
      '1s|#![ ]*/usr/bin/python[^2]\?|#!/usr/bin/python2|' \
    -e \
      '1s|#![ ]*/usr/bin/env python[^2]\?|#!/usr/bin/env python2|' \
    -e \
      '1s|#![ ]*/bin/env python[^2]\?|#!/usr/bin/env python2|' \
    -i \
    $( \
      find \
        . \
	-name \
	  '*.py')
}

build() {
  cd \
    "${_tarname}"
  "${_py}" \
    setup.py \
    build
}

package() {
  cd \
    "${_tarname}"
  "${_py}" \
    setup.py \
      install \
        --prefix='/usr' \
	--root="${pkgdir}" \
	--optimize=1 \
	--skip-build

  install \
    -Dm 644 \
    'LICENSE' \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
