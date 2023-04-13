# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sqlite-fossil
pkgver=r25088.587a304
pkgrel=3
pkgdesc="Self-contained, high-reliability, embedded, full-featured, public-domain, SQL database engine"
arch=('i686' 'x86_64')
url="https://www.sqlite.org/"
license=('custom:Public Domain')
depends=('glibc' 'readline' 'zlib')
makedepends=('fossil' 'tcl')
provides=("sqlite=$pkgver")
conflicts=('sqlite')
options=('staticlibs')
source=("sqlite.fossil::fossil+https://www.sqlite.org/src")
sha256sums=('SKIP')


pkgver() {
  cd "sqlite"

  _hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
  _revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
  printf "r%s.%s" "$_revision" "$_hash"
}

build() {
  cd "sqlite"

  export CPPFLAGS="$CPPFLAGS \
    -DSQLITE_ENABLE_COLUMN_METADATA=1 \
    -DSQLITE_ENABLE_UNLOCK_NOTIFY \
    -DSQLITE_ENABLE_DBSTAT_VTAB=1 \
    -DSQLITE_ENABLE_FTS3_TOKENIZER=1 \
    -DSQLITE_SECURE_DELETE \
    -DSQLITE_MAX_VARIABLE_NUMBER=250000 \
    -DSQLITE_MAX_EXPR_DEPTH=10000"

  ./configure \
    --prefix="/usr" \
    --disable-amalgamation \
    --enable-fts3 \
    --enable-fts4 \
    --enable-fts5 \
    --enable-rtree \
    --enable-json1
  make
  make \
    showdb \
    showjournal \
    showstat4 \
    showwal \
    sqldiff \
    sqlite3_analyzer
}

check() {
  cd "sqlite"

  #make test
}

package() {
  cd "sqlite"

  make DESTDIR="$pkgdir" install

  install -Dm755 {showdb,showjournal,showstat4,showwal,sqldiff} -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/sqlite"
  install -Dm644 sqlite*.1 -t "$pkgdir/usr/share/man/man1"

  # remove tcl extension
  rm -r "$pkgdir/usr/lib"/tcl*
}
