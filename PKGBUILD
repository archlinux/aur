# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Dan Serban
# Contributor: Richard Murri

pkgname='python2-werkzeug'
_commit='54acdd16b247f7037482737e72ec52fc6d50a78d' # 1.0.2 unreleased
pkgver=1.0.2u.r5.g54acdd16
pkgrel=3
pkgdesc='Swiss Army knife of Python web development (legacy Python 2 version)'
arch=('any')
url="https://pypi.org/project/werkzeug/"
license=('custom:BSD')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=(
  'python2-cryptography: for serving WSGI applications'
  'python2-greenlet: alternative for concurrency (multithreading)'
)
checkdepends=(
  'python2-pytest-timeout'
  'python2-requests'
  'python2-requests-unixsocket'
)
_tarname="werkzeug-${_commit}"
source=("${_tarname}.tar.gz::https://github.com/pallets/werkzeug/archive/${_commit}.tar.gz")
b2sums=('805001d280ae0818ea0dbecfe543a08f9fa5a9dcacb03b4cb630dce538cc251295811118d42f5a740f2180bbd429874a63570d34218b5e794a1e3220afe60e94')

prepare() {
  cd "${_tarname}"

  echo "Changing hashbangs in *.py files to refer to 'python2'"
  sed -e '1s|#![ ]*/[a-zA-Z0-9./_ ]*python.*|#!/usr/bin/env python2|' -i $(find . -name '*.py')

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
  cd "${_tarname}"

  echo '-- Using LC_ALL=C.UTF-8 locale to ensure UTF-8 filesystem encoding is used in Python 2'
  export LC_ALL=C.UTF-8
  export PYTHONDONTWRITEBYTECODE=1
  export PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}"
  pytest2 --verbose
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install --verbose -Dm 644 'LICENSE.rst' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -Dm 644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
