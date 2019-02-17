# Maintainer: Tony <tony@criticalstack.com>

pkgname=rocksdb-lite
pkgver=5.18.3
pkgrel=1
pkgdesc='Embedded key-value store for fast storage (lite version)'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=('Apache')
depends=('gperftools' 'zlib' 'bzip2' 'lz4' 'snappy' 'gcc-libs')
checkdepends=('python2')
conflicts=('rocksdb')
provides=('rocksdb')
source=("https://github.com/facebook/rocksdb/archive/v${pkgver}.tar.gz")
sha256sums=('7fb6738263d3f2b360d7468cf2ebe333f3109f3ba1ff80115abd145d75287254')

prepare() {
  cd "${srcdir}/rocksdb-${pkgver}"

  sed -e 's/\bpython\b/python2/' -i Makefile
  if [ "$CARCH"  == "armv6h" ]; then
    sed -e 's/-momit-leaf-frame-pointer//' -i Makefile
  fi
}

build() {
  cd "${srcdir}/rocksdb-${pkgver}"

  env USE_RTTI=1 make shared_lib CFLAGS='-DROCKSDB_LITE -DROCKSDB_USE_RTTI'
}

package() {
  cd "${srcdir}/rocksdb-${pkgver}"

  install -dm755 "${pkgdir}/usr/include"
  cp -r include/rocksdb "${pkgdir}/usr/include"

  install -Dm755 librocksdb.so "${pkgdir}/usr/lib/librocksdb_lite.so"
  install -Dm644 LICENSE.Apache "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.Apache"
  install -Dm644 LICENSE.leveldb "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.leveldb"
}
