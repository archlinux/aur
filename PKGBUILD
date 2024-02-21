# SPDX-License-Identifier: AGPL-3.0
# 
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

_py="python2"
_pkg='chardet'
pkgname="${_py}-${_pkg}"
_name="${_pkg}"
pkgver=4.0.0
pkgrel=3
pkgdesc='Python 2 module for character encoding auto-detection'
arch=(
  'any'
)
url="https://pypi.org/project/${_pkg}"
license=(
  'LGPL'
)
depends=(
  "${_py}"
)
makedepends=(
  "${_py}-setuptools"
)
checkdepends=(
  "${_py}-pytest"
)
_tarname="${_pkg}-${pkgver}"
_pypi="https://pypi.python.org/packages/source"
source=(
  "${_pypi}/${_pkg::1}/${_pkg}/${_tarname}.tar.gz")
b2sums=(
  '6a4c49441a9f21215a752fad970820f623f406695ad30518ac2acd423ed1e467cedbcf743fe63e54ce384d426f62aa2f6b0013b086c3efaba28d8d8f976befc9'
)

prepare() {
  cd \
    "${_tarname}"
  sed \
    -e 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
    -e 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
    -e 's|#![ ]*/bin/env python$|#!/usr/bin/env python2|' \
    -i $(find . -name '*.py')
}

build() {
   cd \
     "${_tarname}"
   "${_py}" \
     setup.py \
       build
}

check() {
   cd \
     "${_tarname}"
   "${_py}" -m pytest
}

package() {
   cd \
     "${_tarname}"
   "${_py}" \
     setup.py \
     install \
       --root="${pkgdir}" \
       --optimize=1

   # To avoid file conflict
   # with the python3 version
   cp \
     "${pkgdir}/usr/bin/${_pkg}ect"{,2}
   mv \
     "${pkgdir}/usr/bin/${_pkg}ect"{,-py2}
}

# vim:set sw=2 sts=-1 et:
