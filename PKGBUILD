# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>
# Contributor: Kaos < gianlucaatlas dot gmail dot com >

pkgname=lib32-sqlite-git
pkgver=3.34.0
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (32-bit)"
arch=('x86_64')
license=('custom')
url="https://www.sqlite.org/"
depends=(lib32-glibc sqlite)
makedepends=('tcl' 'lib32-readline')
provides=(lib32-sqlite)
conflicts=(lib32-sqlite)
source=(git+https://github.com/sqlite/sqlite)
sha256sums=('SKIP')

pkgver() {
   cd sqlite
   git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd sqlite
  autoreconf -vfi
}

build() {
  cd sqlite

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  export LTLINK_EXTRAS="-ldl"
  export CFLAGS="$CFLAGS -DSQLITE_ENABLE_FTS3=1 \
                         -DSQLITE_ENABLE_COLUMN_METADATA=1 \
                         -DSQLITE_ENABLE_UNLOCK_NOTIFY \
                         -DSQLITE_ENABLE_DBSTAT_VTAB=1 \
                         -DSQLITE_ENABLE_FTS3_TOKENIZER=1 \
                         -DSQLITE_ENABLE_RTREE=1 \
                         -DSQLITE_SECURE_DELETE \
                         -DSQLITE_MAX_VARIABLE_NUMBER=250000 \
                         -DSQLITE_MAX_EXPR_DEPTH=10000"

  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-tcl \
    --disable-static \
    --disable-debug

  make
}

package() {
  cd sqlite

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "${pkgdir}"/usr/share/licenses
  ln -s $_pkgbasename "${pkgdir}"/usr/share/licenses/$pkgname
}
