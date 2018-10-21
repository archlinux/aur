# $Id$
# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgbase="sqlite-replication"
pkgname=('sqlite-replication' 'sqlite-replication-tcl' 'sqlite-replication-doc' 'sqlite-replication-analyzer')
_srcver=3250200
_docver=${_srcver}
#_docver=3080001
pkgver=3.25.2
pkgrel=1
pkgdesc="A C library that implements an SQL database engine"
arch=('x86_64')
license=('custom:Public Domain')
url="http://www.sqlite.org/"
makedepends=('tcl' 'readline' 'zlib')
source=(https://www.sqlite.org/2018/sqlite-src-${_srcver}.zip
        https://www.sqlite.org/2018/sqlite-doc-${_docver}.zip
        license.txt
        replication.patch)
options=('!emptydirs' '!makeflags') # json extensions breaks parallel build
sha1sums=('43c087e4e8d2abf8ff723ee787bd8984f7057b6d'
          '31b2679d130e9b1324dc6ff927ff1b13f5d432a4'
          'f34f6daa4ab3073d74e774aad21d66878cf26853'
          '2aa1749d474f5bba4dae3a4faf869b9c11247f52')

prepare() {
  cd sqlite-src-$_srcver
#  autoreconf -vfi
  patch -p1 < ../replication.patch
}

build() {
  export CPPFLAGS="$CPPFLAGS -DSQLITE_ENABLE_COLUMN_METADATA=1 \
                             -DSQLITE_ENABLE_UNLOCK_NOTIFY \
                             -DSQLITE_ENABLE_DBSTAT_VTAB=1 \
                             -DSQLITE_ENABLE_FTS3_TOKENIZER=1 \
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
	--enable-replication \
	TCLLIBDIR=/usr/lib/sqlite$pkgver
  make
  # build additional tools
  make showdb showjournal showstat4 showwal sqldiff sqlite3_analyzer
}

package_sqlite-replication() {

 pkgdesc="A C library that implements an SQL database engine"
 depends=('readline' 'zlib')
 provides=("sqlite=$pkgver" "sqlite3=$pkgver")
 replaces=("sqlite3")
 conflicts=("sqlite")

  cd sqlite-src-$_srcver
  make DESTDIR=${pkgdir} install

  install -m755 showdb showjournal showstat4 showwal sqldiff ${pkgdir}/usr/bin/

  # install manpage
  install -m755 -d ${pkgdir}/usr/share/man/man1
  install -m644 sqlite3.1 ${pkgdir}/usr/share/man/man1/

  # license - no linking required because pkgbase=pkgname
  install -D -m644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgbase}/license.txt

  # split out tcl extension
  mkdir $srcdir/tcl
  mv $pkgdir/usr/lib/sqlite* $srcdir/tcl
}

package_sqlite-replication-tcl() {

 pkgdesc="sqlite Tcl Extension Architecture (TEA)"
 depends=('sqlite')
 provides=("sqlite-tcl=$pkgver" "sqlite3-tcl=$pkgver")
 replaces=("sqlite3-tcl")
 conflicts=("sqlite-tcl")

  install -m755 -d ${pkgdir}/usr/lib
  mv $srcdir/tcl/* ${pkgdir}/usr/lib

  # install manpage
  install -m755 -d ${pkgdir}/usr/share/man/mann
  install -m644 ${srcdir}/sqlite-src-$_srcver/autoconf/tea/doc/sqlite3.n ${pkgdir}/usr/share/man/mann/

  # link license
  install -m755 -d ${pkgdir}/usr/share/licenses
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_sqlite-replication-analyzer() {

 pkgdesc="An analysis program for sqlite3 database files"
 depends=('sqlite' 'tcl')
 provides=("sqlite-analyzer=$pkgver")
 conflicts=("sqlite-analyzer")

  cd sqlite-src-$_srcver
  install -m755 -d ${pkgdir}/usr/bin
  install -m755 sqlite3_analyzer ${pkgdir}/usr/bin/
}

package_sqlite-replication-doc() {

 pkgdesc="most of the static HTML files that comprise this website, including all of the SQL Syntax and the C/C++ interface specs and other miscellaneous documentation"
 #arch=('any') - not yet supported
 provides=("sqlite-doc=$pkgver" "sqlite3-doc=$pkgver")
 replaces=("sqlite3-doc")
 conflicts=("sqlite-doc")

  cd sqlite-doc-${_docver}
  mkdir -p ${pkgdir}/usr/share/doc/${pkgbase}
  cp -R *  ${pkgdir}/usr/share/doc/${pkgbase}/
}
