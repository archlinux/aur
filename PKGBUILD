# Maintainer: Tony <tony@criticalstack.com>

pkgname=rocksdb-static
pkgver=6.2.2
pkgrel=1
pkgdesc='Embedded key-value store for fast storage (static library)'
arch=(i686 x86_64)
url='http://rocksdb.org'
license=('Apache')
depends=('gperftools' 'zlib' 'bzip2' 'lz4' 'snappy' 'gcc-libs')
checkdepends=('python2')
source=("https://github.com/facebook/rocksdb/archive/v${pkgver}.tar.gz"
		"fix-compile-warnings-treated-as-errors-for-gcc9.patch")
sha256sums=('3e7365cb2a35982e95e5e5dd0b3352dc78573193dafca02788572318c38483fb'
            '775b1099346843f0598168aff8d6621857012155234a2d50f87ed4bcad363c2d')

prepare() {
  cd "${srcdir}/rocksdb-${pkgver}"

  sed -e 's/\bpython\b/python2/' -i Makefile
  if [ "$CARCH"  == "armv6h" ]; then
    sed -e 's/-momit-leaf-frame-pointer//' -i Makefile
  fi

  patch -F3 -p1 -i "${srcdir}/fix-compile-warnings-treated-as-errors-for-gcc9.patch"
}

build() {
  cd "${srcdir}/rocksdb-${pkgver}"

  env USE_RTTI=1 make static_lib
}

package() {
  cd "${srcdir}/rocksdb-${pkgver}"

  install -Dm755 librocksdb.a "${pkgdir}"/usr/lib/librocksdb.a
  install -Dm644 LICENSE.Apache "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.Apache"
  install -Dm644 LICENSE.leveldb "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.leveldb"
}
