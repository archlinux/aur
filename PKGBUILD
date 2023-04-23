# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=lumosql
pkgver=r339.be5579f
pkgrel=1
pkgdesc='LumoSQL adds privacy, security and performance options to SQLite.'
arch=('x86_64' 'aarch64')
url="https://lumosql.org/src/lumosql"
license=('custom: MIT')
makedepends=('fossil' 'not-forking' 'tcl' 'tclx' 'readline' 'zlib' 'gzip' 'tar' 'perl' 'git' 'perl-git-wrapper' 'curl' 'patch' 'perl-text-glob')
provides=('sqlite' "sqlite3=${pkgver}" 'libsqlite3.so')
conflicts=('sqlite')
options=('!emptydirs')
source=("${pkgname}::fossil+${url}#commit=be5579f383"
       'sqlite-lemon-system-template.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/sqlite/trunk/sqlite-lemon-system-template.patch')
sha256sums=(SKIP
            '55746d93b0df4b349c4aa4f09535746dac3530f9fd6de241c9f38e2c92e8ee97')

pkgver() {
  cd "$pkgname"
  _hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
  _revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
  printf "r%s.%s" "$_revision" "$_hash"
}

prepare() {
  cd "$pkgname"

  # patch taken from Fedora
  # https://src.fedoraproject.org/rpms/sqlite/blob/master/f/sqlite.spec
  #patch -Np1 -i ../sqlite-lemon-system-template.patch
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

  # build sqlite
  cd "$pkgname"
  #make targets USE_BDB=no USE_SQLITE=no TARGETS='3.41.2+lmdb-0.9.30'

  make build BENCHMARK_RUNS=0 USE_BDB=no USE_SQLITE=no TARGETS='3.37.2+lmdb-0.9.29'
  #TARGETS='3.41.2+lmdb-0.9.30'
  #./configure --prefix=/usr \
#	--disable-static #\
#	--enable-fts3 \
#	--enable-fts4 \
#	--enable-fts5 \
#	--enable-rtree \
#	TCLLIBDIR=/usr/lib/sqlite$pkgver
#  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
#  make
  # build additional tools
#  make showdb showjournal showstat4 showwal sqldiff sqlite3_analyzer
}

package() {
  cd "$pkgname"

  make DESTDIR="${pkgdir}" install

  install -m755 showdb showjournal showstat4 showwal sqldiff "${pkgdir}"/usr/bin/

  # install manpage
  install -m755 -d "${pkgdir}"/usr/share/man/man1
  install -m644 sqlite3.1 "${pkgdir}"/usr/share/man/man1/

  # license - no linking required because pkgbase=pkgname
  install -D -m644 "${srcdir}"/license.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/license.txt

  install -Dm644 LICENCES/MIT.txt "${pkgdir}/usr/share/licenses/${pkgname}/MIT.txt"
}

