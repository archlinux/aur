# Maintainer: M0Rf30

_pkgbase="protobuf"
pkgname=('protobuf3-coex' 'python2-protobuf3-coex' 'python-protobuf3-coex')
pkgver=3.0.2
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format (it coexists with protobuf pkg)"
arch=('i686' 'x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'zlib')
makedepends=('unzip' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/google/${_pkgbase}/archive/v${pkgver}.tar.gz")

build() {
  cd $_pkgbase-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --program-prefix=protobuf3- --libdir=/usr/lib/protobuf3 --includedir=/usr/include/protobuf3
  make $MAKEFLAGS
}

package_protobuf3-coex() {
  conflicts=('protobuf-cpp')
  provides=('protobuf-cpp')
  replaces=('protobuf-cpp')

  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-protobuf3-coex() {
  pkgdesc='Python 2 bindings for Google Protocol Buffers'
  depends=('python2' 'python2-six' "protobuf3-coex=${pkgver}")

  cd $_pkgbase-$pkgver/python

  python2 setup.py install --root="$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/licenses/$_pkgbase/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
  mv $pkgdir/usr/lib/python2.7/site-packages/google/protobuf $pkgdir/usr/lib/python2.7/site-packages/google/protobuf3
  cd $pkgdir/usr/lib/python2.7/site-packages/google/protobuf3
  find . -type f -name "*.py" -exec sed -i 's/google.protobuf/google.protobuf3/g' {} +   
}

package_python-protobuf3-coex() {
  pkgdesc='Python 3 bindings for Google Protocol Buffers'
  depends=('python' 'python-six' "protobuf3-coex=${pkgver}")

  cd $_pkgbase-$pkgver/python
  python3 setup.py install --root="$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/licenses/$_pkgbase/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
  mv $pkgdir/usr/lib/python3.5/site-packages/google/protobuf $pkgdir/usr/lib/python3.5/site-packages/google/protobuf3
  cd $pkgdir/usr/lib/python3.5/site-packages/google/protobuf3
  find . -type f -name "*.py" -exec sed -i 's/google.protobuf/google.protobuf3/g' {} + 
}

md5sums=('845b39e4b7681a2ddfd8c7f528299fbb')
