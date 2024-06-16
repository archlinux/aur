# Maintainer: Raansu <Gero3977@gmail.com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>
pkgname=db4.8
pkgver=4.8.30
pkgrel=8
pkgdesc="The Berkeley DB embedded database system 4.8"
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('custom')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
depends=('gcc-libs')
options=('!libtool' '!makeflags')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz
        'db-atomic.patch'
        'CVE-2017-10140-cwd-db_config.patch'
        'db-4.8.30-format-security.patch')
md5sums=('f80022099c5742cd179343556179aa8c'
	 'd56cef85d0fc9432b54a32993d4c9f06'
         'c2d29f72c20625c09f30e35af3c4f2ff'
         '7609752e93e9f762307c7d9aa204400c')
sha256sums=('e0491a07cdb21fb9aa82773bbbedaeb7639cbd0e7f96147ab46141e0045db72a'
            '7ab718c5624b4724a585c91f4cfdcd3830cfaf0ce1e865a4a79b316ba35990c0'
            '7dfea34368f4d3d5b81973f7b0dbb8a54cdd09effb09b2b28763b2470833a614'
            'fbe47fafa17cd15b3343295c6fc191984e1baa94c1f591dc0b14a96953629437')

prepare() {
  cd "$srcdir/db-$pkgver/"

  chmod +w dbinc/atomic.h
  patch -p1 < "$srcdir"/db-atomic.patch
  
  chmod +w env/env_open.c
  patch -u -p1 < "$srcdir"/CVE-2017-10140-cwd-db_config.patch
  
  patch -u -p1 < "$srcdir"/db-4.8.30-format-security.patch
}

build() {
  cd "$srcdir/db-$pkgver/"

  cd "build_unix"
  CFLAGS=-Wno-error=implicit-function-declaration ../dist/configure --prefix=/usr --enable-compat185 --enable-shared --disable-static --enable-cxx
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

