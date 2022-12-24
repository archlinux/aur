# Maintainer: Tony <tony@libpcap.net>

pkgname=rocksdb-lite
pkgver=7.8.3
pkgrel=1
pkgdesc='Embedded key-value store for fast storage (lite version)'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=('Apache')
depends=('gperftools' 'zlib' 'bzip2' 'lz4' 'snappy' 'gcc-libs')
checkdepends=('python')
conflicts=('rocksdb')
provides=('rocksdb')
source=("https://github.com/facebook/rocksdb/archive/v${pkgver}.tar.gz"
        "fix-uninitialized-read_req.patch")
sha256sums=('b85408a374770897332bf15e51620a5f35720dd416a4749e3899057f9cfaf84d'
            '244fdbe8e4a07dbf54da0f1e90322585eb1d5fbd1906cc09fd154bb200cb694b')

build() {
    cd "${srcdir}/rocksdb-${pkgver}"

    env USE_RTTI=1 DISABLE_WARNING_AS_ERROR=1 \
        make shared_lib CFLAGS='-DROCKSDB_LITE -DROCKSDB_USE_RTTI'
}

package() {
    cd "${srcdir}/rocksdb-${pkgver}"

    install -dm755 "${pkgdir}/usr/include"
    cp -r include/rocksdb "${pkgdir}/usr/include"

    install -Dm755 librocksdb.so "${pkgdir}/usr/lib/librocksdb_lite.so"
    install -Dm644 LICENSE.Apache "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.Apache"
    install -Dm644 LICENSE.leveldb "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.leveldb"
}
