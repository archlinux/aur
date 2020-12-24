# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=('sqlite-minimal-git' 'lemon-minimal-git' 'sqlite-doc-minimal-git')
pkgver=3.34.0
pkgrel=1
pkgdesc="A C library that implements an SQL database engine"
arch=('x86_64')
license=('custom:Public Domain')
url="https://www.sqlite.org/"
makedepends=('readline' 'zlib')
source=("git+https://github.com/sqlite/sqlite"
        'license.txt'
        'sqlite-lemon-system-template.patch')
options=('!emptydirs')
sha256sums=('SKIP'
	    'SKIP'
            'SKIP')

prepare() {
   cd sqlite

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
                             -DSQLITE_SECURE_DELETE \
                             -DSQLITE_MAX_VARIABLE_NUMBER=250000 \
                             -DSQLITE_MAX_EXPR_DEPTH=10000"

  # build sqlite
  cd sqlite
  ./configure --prefix=/usr \
	--disable-static \
	--disable-amalgamation \
	--enable-fts3 \
	--enable-fts4 \
	--enable-fts5 \
	--enable-rtree \
	--enable-json1 \
	--disable-tcl \
	--disable-debug \
	TCLLIBDIR=/usr/lib/sqlite$pkgver
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
  # build additional tools
#  make showdb showjournal showstat4 showwal sqldiff sqlite3_analyzer
}

package_sqlite-minimal-git() {

 pkgdesc="A C library that implements an SQL database engine"
 depends=('readline' 'zlib')
 provides=("sqlite3=$pkgver" 'sqlite')
 replaces=("sqlite3")
 conflicts=(sqlite)

  cd sqlite
  make DESTDIR="${pkgdir}" install

#  install -m755 showdb showjournal showstat4 showwal sqldiff "${pkgdir}"/usr/bin/

  # install manpage
  install -m755 -d "${pkgdir}"/usr/share/man/man1
  install -m644 sqlite3.1 "${pkgdir}"/usr/share/man/man1/

  # license - no linking required because pkgbase=pkgname
  install -D -m644 "${srcdir}"/license.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/license.txt

  # split out tcl extension
  mkdir "$srcdir"/tcl
  mv "$pkgdir"/usr/lib/sqlite* "$srcdir"/tcl
}

package_lemon-minimal-git() {

 # https://www.sqlite.org/lemon.html
 pkgdesc="A parser generator"
 depends=('glibc')
 provides=(lemon)
 conflicts=(lemon)

  cd sqlite
  # ELF file ('usr/bin/lemon') lacks FULL RELRO, check LDFLAGS. - no fix found so far
  install -Dm755 lemon ${pkgdir}/usr/bin/lemon
  install -Dm644 lempar.c ${pkgdir}/usr/share/lemon/lempar.c
  
  mkdir -p "${pkgdir}"/usr/share/doc/${pkgname}
  cp ../sqlite-doc-${_docver}/lemon.html  "${pkgdir}"/usr/share/doc/${pkgname}/
  install -m755 -d "${pkgdir}"/usr/share/licenses
  ln -sf /usr/share/licenses/${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"

}

package_sqlite-doc-minimal-git() {

 pkgdesc="most of the static HTML files that comprise this website, including all of the SQL Syntax and the C/C++ interface specs and other miscellaneous documentation"
 #arch=('any') - not yet supported
 provides=("sqlite3-doc=$pkgver" 'sqlite-doc')
 replaces=("sqlite3-doc")
 conflicts=(sqlite-doc)

  cd sqlite-doc-${_docver}
  mkdir -p "${pkgdir}"/usr/share/doc/${pkgbase}
  cp -R *  "${pkgdir}"/usr/share/doc/${pkgbase}/
  
  rm "${pkgdir}"/usr/share/doc/${pkgbase}/lemon.html
}
