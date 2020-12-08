# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=('sqlite-fts3-parenthesis')
_srcver=3340000
_docver=${_srcver}
pkgver=3.34.0
pkgrel=1
pkgdesc="A C library that implements an SQL database engine. Compiled with 'SQLITE_ENABLE_FTS3_PARENTHESIS' option to allow operators AND and NOT and nested parenthesis in queries."
arch=('x86_64')
license=('custom:Public Domain')
url="https://www.sqlite.org/"
makedepends=('tcl')
depends=('readline' 'zlib')
conflicts=("sqlite")
provides=("sqlite=$pkgver")
replaces=("sqlite3")
source=(https://www.sqlite.org/2020/sqlite-src-${_srcver}.zip)
options=('!emptydirs' '!makeflags') # json extensions breaks parallel build
# upstream now switched to sha3sums - currently not suppoerted by makepkg
sha256sums=('a5c2000ece56d2de13c474658b9cdba6b7f2608a4d711e245518ea02a2a2333e')

package() {
  cd sqlite-src-$_srcver
  make DESTDIR="${pkgdir}" install

  install -m755 showdb showjournal showstat4 showwal sqldiff "${pkgdir}"/usr/bin/

  # install manpage
  install -m755 -d "${pkgdir}"/usr/share/man/man1
  install -m644 sqlite3.1 "${pkgdir}"/usr/share/man/man1/

  # license - no linking required because pkgbase=pkgname
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # split out tcl extension
  mkdir "$srcdir"/tcl
  mv "$pkgdir"/usr/lib/sqlite* "$srcdir"/tcl
}

prepare() {
  cd sqlite-src-$_srcver

  # patch taken from Fedora
  # https://src.fedoraproject.org/rpms/sqlite/blob/master/f/sqlite.spec
#  patch -Np1 -i ../sqlite-lemon-system-template.patch

#  autoreconf -vfi
}

build() {
  export CPPFLAGS="$CPPFLAGS -DSQLITE_ENABLE_COLUMN_METADATA=1 \
                             -DSQLITE_ENABLE_UNLOCK_NOTIFY \
                             -DSQLITE_ENABLE_DBSTAT_VTAB=1 \
                             -DSQLITE_ENABLE_FTS3_TOKENIZER=1 \
                             -DSQLITE_ENABLE_FTS3_PARENTHESIS \
                             -DSQLITE_SECURE_DELETE \
                             -DSQLITE_MAX_VARIABLE_NUMBER=250000 \
                             -DSQLITE_MAX_EXPR_DEPTH=10000"

  # build sqlite
  cd sqlite-src-$_srcver
  ./configure --prefix=/usr \
	--disable-static \
	--disable-amalgamation \
	--enable-fts3 \
	--enable-fts4 \
	--enable-fts5 \
	--enable-rtree \
	--enable-json1 \
	TCLLIBDIR=/usr/lib/sqlite$pkgver
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
  # build additional tools
  make showdb showjournal showstat4 showwal sqldiff sqlite3_analyzer
}

