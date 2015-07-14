# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=rocksdb
pkgver=3.12
pkgrel=1
pkgdesc='Embedded key-value store for fast storage'
arch=(i686 x86_64 armv6h)
url='http://rocksdb.org'
license=(BSD)
depends=(gperftools zlib bzip2 lz4 snappy gcc-libs)
checkdepends=(python2)
source=(https://github.com/facebook/rocksdb/archive/rocksdb-$pkgver.zip)
sha256sums=('1e81391b2cd034e51f48c5659d386608538cf3a3daf87338fa9149da64ba5e04')

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
