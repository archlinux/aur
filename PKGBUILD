pkgname=rocksdb-release
pkgver=6.3.6
pkgrel=1
pkgdesc='Embedded key-value store for fast storage'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=(Apache leveldb)
depends=(
	'bzip2'
	'gcc-libs'
	'lz4'
	'snappy'
	'zlib'
	'gflags'
	)
makedepends=('gcc' 'make')
checkdepends=(python2)
source=(https://github.com/facebook/rocksdb/archive/v$pkgver.zip)
sha256sums=('16187d509b6a2c807d2587048d5f7ee12c10deb284bd749df126efb37bedae78')
provides=(rocksdb)
conflicts=(rocksdb)

prepare() {
  cd rocksdb-$pkgver
  sed -e 's/\bpython\b/python2/' -i Makefile
  if [ "$CARCH"  == "armv6h" ]; then
    sed -e 's/-momit-leaf-frame-pointer//' -i Makefile
  fi
}

build() {
  cd rocksdb-$pkgver
  make clean
  DISABLE_WARNING_AS_ERROR=1 DEBUG_LEVEL=0 make shared_lib sst_dump db_bench -j4
}

#check() {
#  cd rocksdb-rocksdb-$pkgver
#  make check
#}

package() {
  cd rocksdb-$pkgver
  install -d "$pkgdir"/usr/include
  cp -r include/rocksdb "$pkgdir"/usr/include
  install -m755 -D sst_dump "$pkgdir"/usr/bin/sst_dump
  install -m755 -D db_bench "$pkgdir"/usr/bin/db_bench
  install -m755 -D librocksdb.so "$pkgdir"/usr/lib/librocksdb.so
  install -D -m644 LICENSE.Apache "$pkgdir/usr/share/licenses/$pkgname/LICENSE.Apache"
  install -D -m644 LICENSE.leveldb "$pkgdir/usr/share/licenses/$pkgname/LICENSE.leveldb"
}
