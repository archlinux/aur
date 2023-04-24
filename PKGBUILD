# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=lumosql
pkgver=20230111
_sqlite_ver=3.37.2
_lmdb_ver=0.9.29
_tag=be5579f383
pkgrel=1
pkgdesc='Adds privacy, security and performance options to SQLite.'
arch=('x86_64' 'aarch64')
url="https://lumosql.org/src/lumosql"
license=('custom: MIT')
depends=('glibc' 'libedit' 'lmdb' 'zlib')
makedepends=('fossil' 'not-forking' 'tcl' 'tclx' 'readline' 'gzip' 'tar' 'perl' 'git' 'perl-git-wrapper' 'curl' 'patch' 'perl-text-glob')
provides=("lmdb=${_lmdb_ver}")
conflicts=('lmdb')
options=('!emptydirs')
source=("${url}/tarball/${_tag}/lumosql-src-trunk.tar.gz"
        'sqlite-lemon-system-template.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/sqlite/trunk/sqlite-lemon-system-template.patch'
        'lumo-build-opts.patch'
        'lmdb.pc'
        'lumosql.pc')
sha256sums=('4aecb7bd2f67d20f4ad4d15203c92400bd52985f80051f2baa98480c4d3ddf7c'
            '55746d93b0df4b349c4aa4f09535746dac3530f9fd6de241c9f38e2c92e8ee97'
            '40e151879951d62d819dcc463cddbb10a26eddfdbdf7f27136315bac1b3fee10'
            '6eed8c6fde6f5e2523099462779656f7cb92b3fc7384023d96508a6e73a730da'
            '0b413acb44cf29ad939c831130b655fa6898241617fe29f799c76fb281daec50')

prepare() {
    cd "${pkgname}-src-trunk"
    patch --forward --strip=1 --input="${srcdir}/lumo-build-opts.patch"
}

build() {
  export CPPFLAGS="$CPPFLAGS \
	-DSQLITE_ENABLE_COLUMN_METADATA=1 \
	-DSQLITE_ENABLE_UNLOCK_NOTIFY \
	-DSQLITE_ENABLE_DBSTAT_VTAB=1 \
	-DSQLITE_ENABLE_FTS3_TOKENIZER=1 \
	-DSQLITE_ENABLE_FTS3_PARENTHESIS \
	-DSQLITE_SECURE_DELETE \
	-DSQLITE_ENABLE_STMTVTAB \
	-DSQLITE_MAX_VARIABLE_NUMBER=250000 \
	-DSQLITE_MAX_EXPR_DEPTH=10000 \
	-DSQLITE_ENABLE_MATH_FUNCTIONS"

  cd "${pkgname}-src-trunk"

  make build BENCHMARK_RUNS=0 USE_BDB=no USE_SQLITE=no KEEP_SOURCES=1 TARGETS="${_sqlite_ver}+lmdb-${_lmdb_ver}"
}

package() {
  cd "${pkgname}-src-trunk"

  install -Dm644 LICENCES/MIT.txt "${pkgdir}/usr/share/licenses/${pkgname}/MIT.txt"

  cd "build/${_sqlite_ver}+lmdb-${_lmdb_ver}/lumo/build"

  # SQLite3 binary
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 sqlite3 "${pkgdir}/usr/bin/lumosql"

  # SQLite3 shared library
  install -m755 -d "${pkgdir}/usr/lib"
  install -m644 libsqlite3.so.0.8.6 "${pkgdir}/usr/lib/liblumosql.so.0.8.6"
  ln -s /usr/lib/liblumosql.so.0.8.6 "${pkgdir}/usr/lib/liblumosql.so.0"
  ln -s /usr/lib/liblumosql.so.0.8.6 "${pkgdir}/usr/lib/liblumosql.so"

  # LMDB shared library
  install -m644 liblmdb.so "${pkgdir}/usr/lib/"

  # LMDB header file
  install -m755 -d "${pkgdir}/usr/include"
  install -m644 lmdb.h "${pkgdir}/usr/include/"

  cd "../../"

  cd "sources/sqlite3"

  # SQLite3 manpage
  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 sqlite3.1 "${pkgdir}/usr/share/man/man1/lumosql.1"

  # SQLite3 headers
  install -m644 sqlite3.h "${pkgdir}/usr/include/lumosql.h"
  install -m644 sqlite3ext.h "${pkgdir}/usr/include/lumosqlext.h"

  # SQLite3 pkgconfig
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 "${srcdir}/lumosql.pc" "${pkgdir}/usr/lib/pkgconfig/"

  cd "../../"

  cd "sources/lmdb"

  # LMDB binaries
  install -m755 mdb_copy "${pkgdir}/usr/bin/"
  install -m755 mdb_dump "${pkgdir}/usr/bin/"
  install -m755 mdb_load "${pkgdir}/usr/bin/"
  install -m755 mdb_stat "${pkgdir}/usr/bin/"

  # LMDB pkgconfig
  install -m644 "${srcdir}/lmdb.pc" -t "${pkgdir}/usr/lib/pkgconfig/"

  # LMDB manpages
  install -m644 mdb_copy.1 "${pkgdir}/usr/share/man/man1/"
  install -m644 mdb_dump.1 "${pkgdir}/usr/share/man/man1/"
  install -m644 mdb_load.1 "${pkgdir}/usr/share/man/man1/"
  install -m644 mdb_stat.1 "${pkgdir}/usr/share/man/man1/"
}

