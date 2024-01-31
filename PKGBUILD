# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Thore Bödecker <foxxx0@archlinux.org>

_py="python2"
_proj="pytest"
_module="freezegun"
_pkg="${_proj}-${_module}"
pkgname="${_py}-${_pkg}"
pkgver=0.4.2
pkgrel=1
_pkgdesc=(
  "Wrap freezegun's freeze_time"
  "for Pytest (legacy Python 2 version)"
)
pkgdesc="${_pkgdesc[*]}"
arch=('any')
url="https://pypi.org/project/${_pkg}/${pkgver}/"
_ns="ktosiek"
_http="https://github.com"
_url="${_http}/${_ns}/${_pkg}"
license=(
  'MIT'
)
makedepends=(
  "${_py}-setuptools"
)
checkdepends=(
  "${_py}-freezegun"
  "${_py}-pytest"
)
_tar="${_pkg}-${pkgver}"
source=(
  "${_tar}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=('1c89979d85dbdedf87a26de57d1cfe120ed52831e8d69c42b6117ac49c9eb7376bab018a23ca10b582fc583ca61a03930a86878c141b0c5bf4d807552484fe70')

prepare() {
  cd \
    "${_tar}"
  if [[ -d 'tmp_install' ]]; then
        echo "Cleaning the previous 'tmp_install' directory"
        rm -rfv 'tmp_install'
  fi

  echo \
    "Changing hashbangs in *.py files to refer to 'python2'"
  sed \
    -e \
    "1s|#![ ]*/[a-zA-Z0-9./_ ]*python.*|#!/usr/bin/env ${_py}|" \
    -i \
    $( \
      find \
        . \
          -name \
            '*.py')
}

build() {
  cd \
    "${_tar}"
  "${_py}" \
    setup.py \
      build
}

check() {
  cd \
    "${_tar}"
  (
    # lookup path, i.e. 
    # "/usr/lib/python3.8"
    local \
      python_stdlib_basepath="$( \
        "${_py}" \
          -c \
            "from sysconfig import get_path; print(get_path('stdlib'))")"
    # Hack entry points 
    # by installing it
    "${_py}" \
      setup.py \
        install \
          --root="${PWD}/tmp_install" \
          --optimize=1 \
          --skip-build
    export \
      LC_ALL=C.UTF-8 \
      PYTHONDONTWRITEBYTECODE=1 \
      PYTHONPATH="${PWD}/tmp_install/${python_stdlib_basepath/\//}/site-packages:${PYTHONPATH}:${PWD}/tests"
    py.test2 \
      --verbose \
      --cache-clear
  )
}

package() {
  depends=(
    "${_py}"
    "${_py}-${_module}"
    "${_py}-${_proj}"
  )
  cd "${_tar}"
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
        --optimize=1 \
        --skip-build
  install \
    --verbose \
    -Dm 644 \
    'LICENSE' \
    -t \
    "${pkgdir}/usr/share/licenses/${pkgname}"
  install \
    --verbose \
    -Dm 644 \
    'README.rst' \
    -t \
    "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
