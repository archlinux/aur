# Maintainer: Biru Ionut <ionut@archlinux.ro>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>
# Contributor: Kaos < gianlucaatlas dot gmail dot com >

_pkgbasename=sqlite3
pkgname=libx32-sqlite3
_amalgamationver=3071300
pkgver=3.7.13
pkgrel=1.1
pkgdesc="A C library that implements an SQL database engine (x32 ABI)"
arch=('x86_64')
license=('custom')
url="http://www.sqlite.org/"
depends=(libx32-glibc $_pkgbasename)
makedepends=('tcl' 'gcc-multilib-x32' 'libx32-readline')
source=(http://www.sqlite.org/sqlite-src-${_amalgamationver}.zip)
options=(!libtool)
md5sums=('13bb3eaae94592ef3220ea23582763f5')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd ${srcdir}/sqlite-src-${_amalgamationver}
  export LTLINK_EXTRAS="-ldl"
  export CFLAGS="$CFLAGS -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_SECURE_DELETE"
  ./configure --prefix=/usr --libdir=/usr/libx32 \
    --enable-threadsafe \
    --enable-threads-override-locks \
    --enable-cross-thread-connections \
    --disable-static --disable-tcl \
    --enable-load-extension

  # rpath removal
  sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
  sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool

  make
}


package() {
  cd ${srcdir}/sqlite-src-${_amalgamationver}
  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
