#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=rocksdb-tools
pkgver=11.8.1
pkgrel=1
pkgdesc='Core tools from the RocksDB storage'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=(Apache-2.0)
depends=(
    'bzip2'
    'lz4'
    'snappy'
    'zlib'
    'gflags'
    'zstd'
)
makedepends=('clang' 'make')
source=(https://github.com/facebook/rocksdb/archive/v${pkgver}.tar.gz)
sha256sums=('618d9726a7cb1cf4ce034f4cdca49de98aa64867dda06b91371a791ae8921aff')
provides=(rocksdb-tools)

build() {
  cd "rocksdb-$pkgver"

  export CXXFLAGS="$CXXFLAGS -include cstdint"

  make clean
  USE_CLANG=1 DISABLE_WARNING_AS_ERROR=1 DEBUG_LEVEL=0 make ldb sst_dump -j $(nproc)
}

package() {
  cd "rocksdb-$pkgver"

  install -m755 -D ldb "$pkgdir"/usr/bin/rocksdb-ldb
  install -m755 -D sst_dump "$pkgdir"/usr/bin/rocksdb-sst_dump
}
