# Maintainer: Biru Ionut <ionut@archlinux.ro>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>
# Contributor: Kaos < gianlucaatlas dot gmail dot com >

_pkgbasename=sqlite
pkgname=libx32-sqlite
_amalgamationver=3071400
pkgver=3.7.14
pkgrel=2.1
pkgdesc="A C library that implements an SQL database engine (x32 ABI)"
arch=('x86_64')
license=('custom')
url="http://www.sqlite.org/"
depends=(libx32-glibc $_pkgbasename)
makedepends=('tcl' 'gcc-multilib-x32' 'libx32-readline')
source=(http://www.sqlite.org/sqlite-autoconf-${_amalgamationver}.tar.gz)
options=(!libtool)
md5sums=('6464d429b1396a8db35864e791673b65')
provides=("libx32-sqlite3=$pkgver")
replaces=("libx32-sqlite3")
conflicts=("libx32-sqlite3")

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd ${srcdir}/sqlite-autoconf-${_amalgamationver}
  export LTLINK_EXTRAS="-ldl"
  export CFLAGS="$CFLAGS -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_SECURE_DELETE"
  ./configure --prefix=/usr --libdir=/usr/libx32 \
    --enable-threadsafe \
    --disable-static

  # rpath removal
  sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
  sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool

  make
}


package() {
  cd ${srcdir}/sqlite-autoconf-${_amalgamationver}
  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
