# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqlite-fossil
pkgver=r19569.1e30f47
pkgrel=1
pkgdesc="Self-contained, high-reliability, embedded, full-featured, public-domain, SQL database engine"
arch=('i686' 'x86_64')
url="https://www.sqlite.org/"
license=('custom:Public Domain')
depends=('glibc')
makedepends=('fossil' 'tcl' 'readline')
provides=('sqlite')
conflicts=('sqlite')
options=('staticlibs')
source=("license::https://git.archlinux.org/svntogit/packages.git/plain/trunk/license.txt?h=packages/sqlite")
sha256sums=('SKIP')


prepare() {
  mkdir -p "sqlite"
  cd "sqlite"

  fossil clone https://www.sqlite.org/src sqlite.fossil
  fossil open sqlite.fossil
}

pkgver() {
  cd "sqlite"

  _hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
  _revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
  printf "r%s.%s" "$_revision" "$_hash"
}

build() {
  cd "sqlite"

  export CPPFLAGS="$CPPFLAGS -DSQLITE_ENABLE_COLUMN_METADATA=1 \
                             -DSQLITE_ENABLE_UNLOCK_NOTIFY \
                             -DSQLITE_ENABLE_DBSTAT_VTAB=1 \
                             -DSQLITE_ENABLE_FTS3_TOKENIZER=1 \
                             -DSQLITE_SECURE_DELETE \
                             -DSQLITE_MAX_VARIABLE_NUMBER=250000 \
                             -DSQLITE_MAX_EXPR_DEPTH=10000"
  ./configure --prefix="/usr" \
    --disable-amalgamation \
    --enable-fts3 --enable-fts4 --enable-fts5 --enable-rtree --enable-json1
  make
  make showdb showjournal showstat4 showwal sqldiff sqlite3_analyzer
}

check() {
  cd "sqlite"

  #make test
}

package() {
  cd "sqlite"

  make DESTDIR="$pkgdir" install
  install -m755 showdb showjournal showstat4 showwal sqldiff "$pkgdir/usr/bin/"

  install -Dm644 "$srcdir/license" "$pkgdir/usr/share/licenses/sqlite/license"

  install -m755 -d "$pkgdir/usr/share/man/man1"
  install -m644 sqlite*.1 "$pkgdir/usr/share/man/man1/"

  # remove tcl extension
  rm -r "$pkgdir/usr/lib"/tcl*
}
