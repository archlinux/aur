# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=lumosql
pkgver=r339.be5579f
_sqlite_ver=3.37.2
_lmdb_ver=0.9.29
pkgrel=3
pkgdesc='Adds privacy, security and performance options to SQLite.'
arch=('x86_64' 'aarch64')
url="https://lumosql.org/src/lumosql"
license=('custom: MIT')
makedepends=('fossil' 'not-forking' 'tcl' 'tclx' 'readline' 'zlib' 'gzip' 'tar' 'perl' 'git' 'perl-git-wrapper' 'curl' 'patch' 'perl-text-glob')
provides=("sqlite=${_sqlite_ver}" "sqlite3=${_sqlite_ver}" "libsqlite3.so=0-64" "lmdb=${_lmdb_ver}")
conflicts=('sqlite' 'lmdb')
options=('!emptydirs')
source=("${pkgname}::fossil+${url}#commit=be5579f383"
        'sqlite-lemon-system-template.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/sqlite/trunk/sqlite-lemon-system-template.patch'
        'lumo-build-opts.patch'
        'lmdb.pc')
sha256sums=(SKIP
            '55746d93b0df4b349c4aa4f09535746dac3530f9fd6de241c9f38e2c92e8ee97'
            '40e151879951d62d819dcc463cddbb10a26eddfdbdf7f27136315bac1b3fee10'
            '6eed8c6fde6f5e2523099462779656f7cb92b3fc7384023d96508a6e73a730da')

pkgver() {
  cd "$pkgname"
  _hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
  _revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
  printf "r%s.%s" "$_revision" "$_hash"
}

prepare() {
    cd "$pkgname"
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

  cd "$pkgname"

  make build BENCHMARK_RUNS=0 USE_BDB=no USE_SQLITE=no KEEP_SOURCES=1 TARGETS="${_sqlite_ver}+lmdb-${_lmdb_ver}"
}

package() {
  cd "${pkgname}"

  install -Dm644 LICENCES/MIT.txt "${pkgdir}/usr/share/licenses/${pkgname}/MIT.txt"

  cd "build/${_sqlite_ver}+lmdb-${_lmdb_ver}/lumo/build"

  # SQLite3 binary
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 sqlite3 "${pkgdir}/usr/bin/"

  # SQLite3 shared library
  install -m755 -d "${pkgdir}/usr/lib"
  install -m644 libsqlite3.so "${pkgdir}/usr/lib/"
  install -m644 libsqlite3.so.0 "${pkgdir}/usr/lib/"
  install -m644 libsqlite3.so.0.8.6 "${pkgdir}/usr/lib/"

  # LMDB shared library
  install -m644 liblmdb.so "${pkgdir}/usr/lib/"

  # LMDB header file
  install -m755 -d "${pkgdir}/usr/include"
  install -m644 lmdb.h "${pkgdir}/usr/include/"

  cd "../../"

  cd "sources/sqlite3"

  # SQLite3 manpage
  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 sqlite3.1 "${pkgdir}/usr/share/man/man1/"

  # SQLite3 headers
  install -m644 sqlite3.h "${pkgdir}/usr/include/"
  install -m644 sqlite3ext.h "${pkgdir}/usr/include/"

  # SQLite3 pkgconfig
  install -m755 -d "${pkgdir}/usr/lib/pkgconfig"
  install -m644 sqlite3.pc "${pkgdir}/usr/lib/pkgconfig/"

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

