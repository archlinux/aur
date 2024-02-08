# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Truocolo <truocolo@aol.com>
# Maintainer:  Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: prg <prg-archlinux@xannode.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>

_py="python2"
_name="pycurl"
pkgname="${_py}-${_name}"
pkgver=7.45.1
pkgrel=7
pkgdesc='A Python 2 interface to libcurl'
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
  arm
)
url="https://pypi.org/project/${_name}/${pkgver}"
_url="https://github.com/${_name}/${_name}"
license=(
 'LGPL2.1'
 'MIT'
)
depends=(
  'curl'
  'glibc'
  'openssl'
  "${_py}"
)
makedepends=("${_py}-setuptools")
_tagname="REL_${pkgver//./_}"
_tarname="${_name}-${_tagname}"
source=(
  "${_tarname}.tar.gz::${_url}/archive/refs/tags/${_tagname}.tar.gz")
b2sums=(
  'f0cb9cc7687f75d73a1ddab2345b1bbb9ab9b6672344211c510d3b6e1d8a0a34c85beb94850a6079d00dbd19fce6ea6ca3998a0ad329250445aa705007554163')

prepare() {
  cd \
    "${_tarname}"
  printf \
    "Changing hashbangs in *.py files to refer to '${_py}'... "
  sed \
    -e \
    "1s|#![ ]*[a-z0-9._/]*/bin/[a-z0-9._/ ]*python.*|#!/usr/bin/env ${_py}|" \
    -i \
    $( \
      find \
        . \
	-name \
	  '*.py')
  echo \
    'done'
  echo \
    "Disabling documentation " \
    "inclusion in setup.py"
  sed \
    -e \
    $'/setup_args\[\'data_files\'\]/d' \
    -i \
    'setup.py'
}

build() {
  cd \
    "${_tarname}"
  "${_py}" \
    setup.py \
      build
}

package() {
  local \
    _py_opts=()
  _py_opts=(
    --root="${pkgdir}"
    # --prefix='/usr'
    --optimize=1
    --skip-build
  )
  cd \
    "${_tarname}"
  "${_py}" \
    setup.py \
      install \
        "${_py_opts[@]}"

  grep \
    -A \
      100000 \
    -e \
    "^License$" \
    'README.rst' > \
    'LICENSE.rst'
  install \
    --verbose \
    -Dm 644 \
    'LICENSE.rst' \
    'COPYING-MIT' \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"
  ln \
    --verbose \
    --symbolic \
    '/usr/share/licenses/common/LGPL2.1/license.txt' \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-LGPL"
}

# vim:set sw=2 sts=-1 et:
