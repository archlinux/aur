# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=manticore
pkgver=7.4.6
pkgrel=3
pkgdesc='Manticore Search – easy-to-use open-source fast database for search'
arch=(any)
url='https://manticoresearch.com'
license=(GPL-3.0)
depends=(libxml2 openssl-1.1 re2 boost-libs zstd xxhash mariadb-libs postgresql-libs unixodbc)
makedepends=(cmake bison flex boost clang)
source=(https://github.com/manticoresoftware/manticoresearch/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('413cf45b2cad144a40021aa1deb389ca2a5076a3c906759e66df0ca6e15570de')
backup=(
	'etc/manticoresearch/manticore.conf'
	'etc/default/manticore'
	'etc/default/manticore-indexer_global'
)
install='manticore.install'

prepare() {
	cd "manticoresearch-$pkgver"
	patch -Np1 -i ../../fix-gcc14.patch
}

build() {
	cmake -B build -S "manticoresearch-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_SYSCONFDIR=/etc \
		-DDISTR_BUILD=archlinux \
		-DUSE_SYSLOG=1 \
		-DWITH_GALERA=1 \
		-DWITH_RE2=1 \
		-DWITH_RE2_FORCE_STATIC=1 \
		-DWITH_STEMMER=1 \
		-DWITH_STEMMER_FORCE_STATIC=1 \
		-DWITH_ICU=1 \
		-DWITH_ICU_FORCE_STATIC=1 \
		-DWITH_SSL=1 \
		-DWITH_ZLIB=1 \
		-DWITH_ODBC=1 \
		-DDL_ODBC=1 \
		-DWITH_EXPAT=1 \
		-DDL_EXPAT=1 \
		-DWITH_ICONV=1 \
		-DWITH_MYSQL=1 \
		-DDL_MYSQL=1 \
		-DWITH_POSTGRESQL=1 \
		-DDL_POSTGRESQL=1 \
		-DLOCALDATADIR=/var/lib/manticore/data \
		-DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.1 \
		-DOPENSSL_SSL_LIBRARY=/usr/lib/libssl.so.1.1 \
		-DOPENSSL_CRYPTO_LIBRARY=/usr/lib/libcrypto.so.1.1

	cmake --build build -j$(nproc) --config RelWithDebInfo
}

package() {
	DESTDIR="$pkgdir" cmake --install build --config RelWithDebInfo
	install -d "$pkgdir/var/lib/manticore"
	install -d "$pkgdir/var/log/manticore"
	install -Dm644 "../README" "$pkgdir/usr/share/doc/MANTICORE/README"
	install -Dm644 "../manticore.default" "$pkgdir/etc/default/manticore"
	install -Dm644 "../manticore-indexer_global.default" "$pkgdir/etc/default/manticore-indexer_global"
	install -Dm644 "../manticore.logrotate" "$pkgdir/etc/logrotate.d/manticore"
	install -Dm755 "../manticore_new_cluster" "$pkgdir/usr/bin/manticore_new_cluster"
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "../manticore.service" "../manticore-indexer.service" "../manticore-indexer@.service"
}
