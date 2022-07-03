# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Dan Serban
# Contributor: Richard Murri

pkgname='python2-werkzeug'
_name="${pkgname#python2-}"
pkgver=1.0.1
pkgrel=3
pkgdesc='Swiss Army knife of Python web development (legacy Python 2 version)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
_repourl="https://github.com/pallets/${_name}"
license=('custom:BSD')
makedepends=('python2-setuptools')
optdepends=(
  'python2-cryptography: for serving WSGI applications'
  'python2-greenlet: alternative for concurrency (multithreading)'
)
_checkdepends_needed=(
  'python2-pytest-timeout'
  'python2-requests'
  'python2-requests-unixsocket'
)
optdepends+=("${_checkdepends_needed[@]/%/: needed for check() during build}")
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::${_repourl}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('d2dcdce8b1bcbb177b52b0915f2c0ac17d235dee3c77b23e81e4b35412d1f53a194d3c7c7f2a5c065ade99797effe72cc464cf6980b12c761a8a919338021660')

_checkinstalled() {
  pacman --deptest $@
}

prepare() {
  cd "${_tarname}"

  echo "Changing hashbangs in *.py files to refer to 'python2'"
  sed -e '1s|#![ ]*/[a-zA-Z0-9./_ ]*python.*|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')

  echo "Configuring 'setup.cfg': pytest: don't treat warnings as errors"
  sed -e '/filterwarnings =/{n' \
      -e '/    error/d' \
      -e '}' \
      -i 'setup.cfg'
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  ( _checkinstalled "${_checkdepends_optional[@]}" > /dev/null ) \
    || echo "Skipping testing: checkdepends not installed:"; \
    ( _checkinstalled "${_checkdepends_optional[@]}" ) || \
    return 0

  cd "${_tarname}"
  (
    echo '-- Using LC_ALL=C.UTF-8 locale to ensure UTF-8 filesystem encoding is used in Python 2'
    export LC_ALL=C.UTF-8
    export PYTHONDONTWRITEBYTECODE=1
    export PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}"
    pytest2 --verbose
  )
}

package() {
  depends=('python2')

  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build

  install --verbose -Dm 644 'LICENSE.rst' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -Dm 644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
