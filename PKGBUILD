pkgname=rocksdb-ldb
pkgver=6.6.4
pkgrel=1
pkgdesc='The 'ldb' from the RocksDB storage'
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
makedepends=('gcc' 'make' 'diffutils')
source=(https://github.com/facebook/rocksdb/archive/v6.6.4.tar.gz)
sha256sums=('feab859ee355fbe7beffd7085904b63f560417f450f83cc34310e6dadff936f6')
provides=(rocksdb-ldb)

prepare() {
  ls -alh
  cd "rocksdb-$pkgver"
  sed -e 's/\bpython\b/python2/' -i Makefile
  if [ ""  == "armv6h" ]; then
    sed -e 's/-momit-leaf-frame-pointer//' -i Makefile
  fi
}

build() {
  cd "rocksdb-$pkgver"
  make clean
  DISABLE_WARNING_AS_ERROR=1 DEBUG_LEVEL=0 make ldb -j4
}

package() {
  cd "rocksdb-$pkgver"
  install -m755 -D ldb "$pkgdir"/usr/bin/rocksdb-ldb
}
