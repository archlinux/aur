# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Schubert <mschu.dev at gmail>

pkgname='python2-pysocks'
_name='PySocks'
pkgver=1.7.1
_commit='f660e75d4844e64e4b162b0c01f8df8d866ee000'
pkgrel=3
pkgdesc='SOCKS4 and SOCKS5 proxy module (deprecated)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=(
  'lib32-glibc'
  'python2-twisted'
  'python2-tornado'
)
provides=('python2-socks')
_sourcedirname="${_name}-${pkgver}"
source=("${_sourcedirname}.tar.gz::https://github.com/Anorov/PySocks/archive/$_commit.tar.gz")
b2sums=('7f529112ebb6327886461a26b863c19097f760ce40d695c722a776923fa811c3bffa82d5640927d49324dac41120c851975c78eeb5b0aae116f45b187fa755b1')

prepare() {
  mv "${_name}-${_commit}" "${_sourcedirname}"

  cd "${_sourcedirname}"

  # Change hashbangs to python2
  sed -e 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
      -e 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
      -e 's|#![ ]*/bin/env python$|#!/usr/bin/env python2|' \
      -i $(find . -name '*.py')
}

build() {
  cd "${_sourcedirname}"
  python2 setup.py build
}

check_disabled() {
  cd "${_sourcedirname}/test"

  python2 socks4server.py &
  _SOCKS4SERVER=$!

  python2 httpproxy.py &
  _HTTPPROXY=$1

  ./mocks start

  sleep 1

  python2 sockstest.py

  ./mocks shutdown

  kill "${_SOCKS4SERVER}" "${_HTTPPROXY}"
}

package() {
  cd "${_sourcedirname}"
  python2 setup.py install --prefix='/usr' --root="${pkgdir}" --optimize=1

  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
