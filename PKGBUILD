# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_pkgbase="protobuf"
pkgname=('protobuf3' 'python2-protobuf3' 'python-protobuf3')
pkgver=3.0.0_alpha_3.1
_pkgver=$(echo $pkgver | tr _ -)
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('i686' 'x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'zlib')
makedepends=('unzip' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/google/${_pkgbase}/archive/v${_pkgver}.tar.gz")
md5sums=('9f4bb26dadd8ee578d8974fa854cae37')

build() {
  cd $_pkgbase-$_pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make $MAKEFLAGS

  rm -rf python3
  cp -r python python3
  find python3 -name '*.py' -exec 2to3 --write --nobackups '{}' '+'
}

check() {
  make -C $_pkgbase-$_pkgver check
}

package_protobuf3() {
  conflicts=('protobuf' 'protobuf-cpp')
  provides=('protobuf' 'protobuf-cpp')
  replaces=('protobuf-cpp')

  cd $_pkgbase-$_pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -Dm644 editors/protobuf-mode.el \
    "$pkgdir"/usr/share/emacs/site-lisp/protobuf-mode.el
}

package_python2-protobuf3() {
  pkgdesc='Python 2 bindings for Google Protocol Buffers'
  depends=('python2' "protobuf3=${pkgver}")
  conflicts=('python2-protobuf')
  provides=('python2-protobuf')

  cd $_pkgbase-$_pkgver/python
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/licenses/$_pkgbase/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python-protobuf3() {
  pkgdesc='Python 3 bindings for Google Protocol Buffers'
  depends=('python' "protobuf3=${pkgver}")
  conflicts=('python-protobuf')
  provides=('python-protobuf')

  cd $_pkgbase-$_pkgver/python3
  python3 setup.py install --prefix=/usr --root="$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/licenses/$_pkgbase/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}
