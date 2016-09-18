# Maintainer: Raansu <Gero3977@gmail.com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>
pkgname=db4.8
pkgver=4.8.30
pkgrel=5
pkgdesc="The Berkeley DB embedded database system 4.8"
arch=('any')
license=('custom')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
depends=('gcc-libs')
options=('!libtool' '!makeflags')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz)
md5sums=('f80022099c5742cd179343556179aa8c')
sha256sums=('e0491a07cdb21fb9aa82773bbbedaeb7639cbd0e7f96147ab46141e0045db72a')

build() {
  cd "$srcdir/db-$pkgver/"

  cd "build_unix"
  ../dist/configure --prefix=/usr --enable-compat185 --enable-shared --disable-static --enable-cxx
  make LIBSO_LIBS=-lpthread || return 1
}

package() {  
  cd "$srcdir/db-$pkgver/"
  
  cd "build_unix"
  make prefix="$pkgdir/usr" includedir="$pkgdir/usr/include/db4.8" install

# Remove documents to save space, these can be found online if needed.
  rm -rf "$pkgdir/usr/docs"

# Remove conflicting symlinks created by make, should never overwrite 
# main libdb symlinks to current version. Programs that need or use 
# db4.8 should be able to find it.
  rm -f "$pkgdir/usr/lib/libdb.so"
  rm -f "$pkgdir/usr/lib/libdb_cxx.so"
  rm -f "$pkgdir/usr/lib/libdb-4.so"
  rm -f "$pkgdir/usr/lib/libdb_cxx-4.so"

# Rename db4.8 bin files to not conflict with current db version 
# installed. Programs that need or use db4.8 should be aware of this 
# name change. 
  cd "$pkgdir/usr/bin"
  for i in *; do
    mv $i db4.8_${i/db_/}
  done

# Install license.
  install -Dm644 "$srcdir/db-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

