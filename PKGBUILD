# Maintainer: kikadf <kikadf.01@gmail.com>

pkgbase='protobuf-mir'
pkgname=('protobuf-mir' 'python2-protobuf-mir' 'python-protobuf-mir')
pkgver=3.0.0
_gtestver=1.8.0
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'zlib')
makedepends=('unzip' 'python-setuptools' 'python2-setuptools' 'clang')
source=("$pkgbase-$pkgver.tgz::https://github.com/google/protobuf/archive/v${pkgver}.tar.gz"
        "gtest-${_gtestver}.tar.gz::https://github.com/google/googletest/archive/release-${_gtestver}.tar.gz"
        "https://raw.githubusercontent.com/kikadf/patches/master/protobuf-mir/Hide-unnecessary-exported-library-symbols.patch"
        "https://raw.githubusercontent.com/kikadf/patches/master/protobuf-mir/Restore-New-Callback-into-google-protobuf-namespace.patch")
md5sums=('d4f6ca65aadc6310b3872ee421e79fa6'
         '16877098823401d1bf2ed7891d7dce36'
         '17f3b316fda201b0857d1e68e703910a'
         'b39a208f8b3104f7d040c6b322a42cc9')

prepare() {
  cd "protobuf-$pkgver"

  patch -p1 -i ../Hide-unnecessary-exported-library-symbols.patch
  patch -p1 -i ../Restore-New-Callback-into-google-protobuf-namespace.patch

  rm -rf gmock && cp -r "$srcdir/googletest-release-${_gtestver}/googlemock" gmock
  rm -rf googletest && cp -r "$srcdir/googletest-release-${_gtestver}/googletest" googletest
  ln -sf ../googletest gmock/gtest

  sed -r 's|/usr/bin/env python|/usr/bin/env python2|' -i googletest/scripts/*.py
}

build() {
  # GCC is stuck on src/google/protobuf/util/internal/protostream_objectsource_test.cc
  # and src/google/protobuf/util/internal/protostream_objectwriter_test.cc.
  export CC=/usr/bin/clang CXX=/usr/bin/clang++

  cd "$srcdir/protobuf-$pkgver"
  ./autogen.sh

  cd "$srcdir/protobuf-$pkgver/googletest"
  ./configure
  make

  cd "$srcdir/protobuf-$pkgver/gmock"
  ./configure
  make

  cd "$srcdir/protobuf-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  make -C "$srcdir/protobuf-$pkgver" check
}
package_protobuf-mir() {
  conflicts=('protobuf')
  provides=('protobuf')

  cd "$srcdir/protobuf-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 editors/protobuf-mode.el "$pkgdir"/usr/share/emacs/site-lisp/protobuf-mode.el
}

package_python2-protobuf-mir() {
  pkgdesc='Python 2 bindings for Google Protocol Buffers'
  depends=('python2' 'python2-six' "protobuf-mir=$pkgver")
  conflicts=('python2-protobuf')
  provides=('python2-protobuf')

  cd "$srcdir/protobuf-$pkgver/python"
  python2 setup.py install --root="$pkgdir"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/share/licenses/$pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-protobuf-mir() {
  pkgdesc='Python 3 bindings for Google Protocol Buffers'
  depends=('python' 'python-six' "protobuf-mir=$pkgver")
  conflicts=('python-protobuf')
  provides=('python-protobuf')

  cd "$srcdir/protobuf-$pkgver/python"
  python3 setup.py install --root="$pkgdir"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/share/licenses/$pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
