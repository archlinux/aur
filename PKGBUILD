# Maintainer: Tony <tony@criticalstack.com>

pkgname=rocksdb-static
pkgver=5.13.1
pkgrel=1
pkgdesc='Embedded key-value store for fast storage (static library)'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=('Apache')
depends=(gperftools zlib bzip2 lz4 snappy gcc-libs)
checkdepends=(python2)
source=(https://github.com/facebook/rocksdb/archive/v$pkgver.zip
		fix-gcc-8-warnings.patch)
sha256sums=('f0f5e3b7623ab7a7a13c407d8c00f6ddbef94be619742f3fcfef7ca5eceed915'
            '2c5d96fbf1638d899da84b4a80ad3c6060b774ed80148f443ae40672d31df9d3')

prepare() {
  cd rocksdb-$pkgver
  sed -e 's/\bpython\b/python2/' -i Makefile
  if [ "$CARCH"  == "armv6h" ]; then
    sed -e 's/-momit-leaf-frame-pointer//' -i Makefile
  fi
  patch -Np1 -i ../fix-gcc-8-warnings.patch
}

build() {
  cd rocksdb-$pkgver
  export USE_RTTI=1
  make static_lib
}

package() {
  cd rocksdb-$pkgver
  install -m755 -D librocksdb.a "$pkgdir"/usr/lib/librocksdb.a
  install -D -m644 LICENSE.Apache "$pkgdir/usr/share/licenses/$pkgname/LICENSE.Apache"
  install -D -m644 LICENSE.leveldb "$pkgdir/usr/share/licenses/$pkgname/LICENSE.leveldb"
}
