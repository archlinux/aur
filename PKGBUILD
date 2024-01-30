# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Schubert <mschu.dev at gmail>

_checks=false
_py="python2"
_pkg="pysocks"
pkgname="${_py}-${_pkg}"
_Pkg='PySocks'
pkgver=1.7.1.r7.gf4c3cd9
_commit='f4c3cd9897898de69e136c92fd957fd989ee08ec'
pkgrel=1
_pkgdesc=(
  'SOCKS4 and SOCKS5 proxy module'
  '(deprecated) (Python 2 package)'
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'any')
_repo_maintainer='urllib3'
url="https://github.com/${_repo_maintainer}/${_Pkg}"
license=(
  'BSD'
)
makedepends=(
  "${_py}--setuptools"
)
checkdepends=()
[[ "${_checks}" == 'true' ]] && \
  checkdepends+=(
#   'lib32-glibc'
#   'python2-twisted'
    'python2-tornado'
)
_tarname="${_name}-${_commit}"
source=(
  "${_tarname}.tar.gz::${url}/archive/${_commit}.tar.gz"
  "0001-Fix_HTTP_basic_auth.patch::https://github.com/Anorov/${_name}/pull/147.patch"
  "0002-Change_error_type_to_match_native_socket_error.patch::https://github.com/Anorov/${_name}/pull/154.patch"
  "0003-Properly_convert_unsigned_integer_fix_urllib3_PySocks_issue_4.patch::${url}/pull/5.patch"
)
b2sums=(
  '1c7869c0c49ca44db02b4b9118f703d41be0902d78d38258ed8e93db897736612a9793be4b648495e58d801afa58f14c814243c97055b8f2781d0ed286909c9d'
  'c43421895dadd00a7845aff973e14eebc12284e4dac71a8c864803beb9e6d418971c518172a194249aece031118e35de074bbf5233a9c5359b3fcb7b99da4f2e'
  'c05bc0df73783d97879319f69d0b7130380063bd284732944d5876f60a64d05c88e5cafeebd903ef358a5f8cd65818c57a03d842bb95f0c0d4d38d5bd7b099bb'
  '76b27a8e8f99dba9e779c638f1b7ffdf5a689fd880cfb69878e9e3f832e23fa32ac0ca0d5c6435db9d9944bab5b006b9800e23dafbae4b63e5fe626f985089be'
)

prepare() {
  local \
    _patch
  cd \
    "${_tarname}"

  for _patch \
    in "${srcdir}"/*.patch; do
    echo  \
      "--> Applying ${patch}..."
    patch \
      --verbose \
      --unified \
      -Np1 \
      -i \
      "${_patch}"
    echo
  done
  printf \
    "Changing hashbangs in *.py files to refer to 'python2'... "
  sed \
    -e '1s|#![ ]*/[a-zA-Z0-9./_ ]*python.*|#!/usr/bin/env python2|' \
    -i \
    $( \
      find \
        . \
        -name \
          '*.py')
  echo \
    "done"
}

build() {
  cd \
    "${_tarname}"
  "${_py}" \
    setup.py \
      build
}

check() {
  if [[ "${_checks}" == true ]]; then
    _check
  fi
}

_check() {
  cd \
    "${_tarname}/test"
  "${_py}" \
    socks4server.py &
  _SOCKS4SERVER=$!
  "${_py}" \
    httpproxy.py &
  _HTTPPROXY=$1
  ./mocks \
    start
  sleep \
    1
  "${_py}" \
    sockstest.py
  ./mocks \
    shutdown
  kill \
    "${_SOCKS4SERVER}" \
    "${_HTTPPROXY}"
}

package() {
  depends=(
    'python2'
  )
  provides=(
    "python2-socks=${pkgver%.r*}"
  )

  cd \
    "${_tarname}"
  python2 \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1 \
        --skip-build

  install \
    --verbose \
    -Dm 644 \
    'LICENSE' \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install \
    --verbose \
    -Dm 644 \
    'README.md' \
    -t \
    "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
