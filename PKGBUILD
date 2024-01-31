# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Thore Bödecker <foxxx0@archlinux.org>

pkgname='python2-pytest-freezegun'
_name="${pkgname#python2-}"
pkgver=0.4.2
pkgrel=1
pkgdesc="Wrap freezegun's freeze_time for Pytest (legacy Python 2 version)"
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
_repourl="https://github.com/ktosiek/${_name}"
license=('MIT')
makedepends=('python2-setuptools')
checkdepends=(
  'python2-freezegun'
  'python2-pytest'
)
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::${_repourl}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('1c89979d85dbdedf87a26de57d1cfe120ed52831e8d69c42b6117ac49c9eb7376bab018a23ca10b582fc583ca61a03930a86878c141b0c5bf4d807552484fe70')

prepare() {
  cd "${_tarname}"

  if [[ -d 'tmp_install' ]]; then
        echo "Cleaning the previous 'tmp_install' directory"
        rm -rfv 'tmp_install'
  fi

  echo "Changing hashbangs in *.py files to refer to 'python2'"
  sed -e '1s|#![ ]*/[a-zA-Z0-9./_ ]*python.*|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  cd "${_tarname}"
  (
    # lookup path, i.e. "/usr/lib/python3.8"
    local python_stdlib_basepath="$(python2 -c "from sysconfig import get_path; print(get_path('stdlib'))")"

    # Hack entry points by installing it
    python2 setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build

    export LC_ALL=C.UTF-8
    export PYTHONDONTWRITEBYTECODE=1
    export PYTHONPATH="${PWD}/tmp_install/${python_stdlib_basepath/\//}/site-packages:${PYTHONPATH}:${PWD}/tests"
    py.test2 --verbose --cache-clear
  )
}

package() {
  depends=(
    'python2'
    'python2-freezegun'
    'python2-pytest'
  )
  cd "${_tarname}"
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
