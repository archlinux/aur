# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=edgedb
pkgver=3.1
pkgrel=1
pkgdesc="A graph-relational database with declarative schema, built-in migration system, and a next-generation query language."
arch=('x86_64')
url="https://www.edgedb.com/"
license=('Apache')
depends=('python>=3.10'
	'python-parsing>=2.0.3'
	'python-edgedb=1.3.0'
	'postgresql>=13'
	'python-httptools>=0.3.0'
	'python-immutables>=0.18'
	'python-uvloop>=0.17.0'
	'python-click>=7.1'
	'python-cryptography>=35.0'
	'python-graphql-core>=3.1.5'
	'python-jwcrypto>=1.3.1'
	'python-psutil>=5.8'
	'python-setproctitle>=1.2'
	'python-wcwidth>=0.2'
)
makedepends=('git' 'python-setuptools>=67' 'cython>=0.29.32' 'cython<0.30.0' 'python-setuptools-rust>=0.12.1' 'yarn')
checkdepends=()
optdepends=('edgedb-cli' 'pgvector')
backup=('etc/edgedb/server.conf'
	'etc/edgedb/tls-certificate.pem'
	'etc/edgedb/tls-private-key.pem'
	'etc/edgedb/jws-keys.pem'
	'etc/edgedb/jwe-keys.pem')
options=()
_pgproto="5ae66af0337030405f996d7d13110505a2164374"
_pgquery="1097b2c33e54a37c0d2c0f2d498c7d1cf967eae9"
install=edgedb.install
source=("git+https://github.com/edgedb/edgedb.git#tag=v${pkgver}"
	"https://github.com/MagicStack/py-pgproto/archive/${_pgproto}.zip"
	"https://github.com/pganalyze/libpg_query/archive/${_pgquery}.zip"
	"server.conf"
	"${pkgname}.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
	"build.patch")
sha256sums=('SKIP'
            '3c569126de08bd46214e790c7f6b4d8129897fd41f2a8458a07b6ff5fae6480c'
            'd872b4afc03d9c11297f162dc38ef1f18a420dcfd36b5f197bdfe8f6a47d49e8'
            '3b8d610edc8b152f420cbe4a93741f85c8d1548914854741e14121a662c2bbba'
            '34992dd2a9e5c28b5120c2bbcc64d6d49e6ce797797155431b19e27b5ff88cf2'
            'c5c8e4fe88cba51a25709ded30e9e611ed53b57280b135d37bb8dde81857410d'
            'c3fad5eac89d5be31c51abdfbef61adc171a4a01f505a74687f8585e3dde8894'
            'b5e51dd4acc8fe5fb492ef31e0ffbc5f81cf733860da7de5248521435ab4384d')

prepare() {
	cd "$pkgname"
	rmdir "edb/server/pgproto/" "edb/pgsql/parser/libpg_query/"
	ln -s "$srcdir/py-pgproto-$_pgproto" "edb/server/pgproto"
	ln -s "$srcdir/libpg_query-$_pgquery" "edb/pgsql/parser/libpg_query"
	patch -p1 -i "$srcdir/build.patch"
}

build() {
	cd "$pkgname"
	export EDGEDB_BUILD_IS_RELEASE=1
	python setup.py build_libpg_query
	python setup.py build_ext
	python setup.py build_parsers
	python setup.py build_py
	python setup.py build_metadata --pg-config=/usr/bin/pg_config --runstatedir=/run/edgedb --shared-dir=/usr/share/edgedb

	mkdir -p share
	_EDGEDB_BUILDMETA_SHARED_DATA_DIR=share python setup.py build_ui

	mkdir -p inst etc
	python setup.py install --root=inst --skip-build
	PYTHONPATH=inst$(python -c 'import site; print(site.getsitepackages()[0])') \
		_EDGEDB_WRITE_DATA_CACHE_TO=share \
		inst/usr/bin/edgedb-server --temp-dir --bootstrap-only \
		--tls-cert-mode generate_self_signed \
		--tls-cert-file etc/tls-certificate.pem \
		--tls-key-file etc/tls-private-key.pem \
		--jose-key-mode generate \
		--jws-key-file etc/jws-keys.pem \
		--jwe-key-file etc/jwe-keys.pem
}

package() {
	install -Dm 644 server.conf -t "${pkgdir}/etc/edgedb"
	install -Dm 644 ${pkgname}.service -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm 644 ${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	cd "$pkgname"
	export EDGEDB_BUILD_IS_RELEASE=1
	python setup.py install --root="$pkgdir" --skip-build
	rm $pkgdir/usr/bin/{edb,edgedb}
	find "${pkgdir}" -type f -name "*.c" -execdir rm {} +
	install -d 755 $pkgdir/usr/share/edgedb
	cp -r share/ui $pkgdir/usr/share/edgedb/
	install -Dm 644 share/backend* -t $pkgdir/usr/share/edgedb
	install -Dm 644 etc/* -t $pkgdir/etc/edgedb
}
