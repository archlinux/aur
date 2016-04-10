pkgbase=python-nfc
pkgname=('python-nfc' 'python2-nfc')
pkgver=r83.4f4d194
pkgrel=1
pkgdesc='Python bindings for libnfc'
arch=('i686' 'x86_64')
license=(BSD)
url="https://github.com/xantares/nfc-bindings"
makedepends=('cmake' 'swig' 'libnfc' 'python' 'python2')
source=("git+https://github.com/xantares/nfc-bindings.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/nfc-bindings"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cp -r "$srcdir"/nfc-bindings "$srcdir"/nfc-bindings-py2

  cd "$srcdir"/nfc-bindings
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr ..

  cd "$srcdir"/nfc-bindings-py2
  mkdir -p build && pushd build
  cmake \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DCMAKE_INSTALL_PREFIX=/usr ..
}

package_python-nfc()
{
  depends=('python' 'libnfc')

  cd "$srcdir"/nfc-bindings/build
  make DESTDIR="$pkgdir" install
}

package_python2-nfc()
{
  depends=('python2' 'libnfc')

  cd "$srcdir"/nfc-bindings-py2/build
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/share
}

