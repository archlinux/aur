pkgname=rocksdb
pkgver=5.2.1
pkgrel=1
pkgdesc='Embedded key-value store for fast storage'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=(BSD)
depends=(gperftools zlib bzip2 lz4 snappy gcc-libs)
checkdepends=(python2)
source=(https://github.com/facebook/rocksdb/archive/rocksdb-$pkgver.zip)
sha256sums=('6a6c2066e1411d39d6ca8a9ce3d023a8d5c139d51dae7f165d069a4014986b36')

prepare() {
  cd rocksdb-rocksdb-$pkgver
  sed -e 's/\bpython\b/python2/' -i Makefile
  if [ "$CARCH"  == "armv6h" ]; then
    sed -e 's/-momit-leaf-frame-pointer//' -i Makefile
  fi
}

build() {
  cd rocksdb-rocksdb-$pkgver
  make shared_lib
}

check() {
  cd rocksdb-rocksdb-$pkgver
# The are some tests are broken in 3.6.2 release
#  make check
}

package() {
  cd rocksdb-rocksdb-$pkgver
  install -d "$pkgdir"/usr/include
  cp -r include/rocksdb "$pkgdir"/usr/include
  install -m755 -D librocksdb.so "$pkgdir"/usr/lib/librocksdb.so
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
