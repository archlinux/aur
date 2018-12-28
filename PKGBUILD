# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
pkgname=('llvm37')
pkgver=3.7.1
pkgrel=1
pkgdesc="Low Level Virtual Machine (installed into /opt/llvm37)"
arch=('x86_64')
url="https://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
depends=('libedit' 'zlib')
makedepends=('libffi' 'python' 'gcc-multilib')
options=('staticlibs')
source=("https://releases.llvm.org/$pkgver/llvm-$pkgver.src.tar.xz"
        "bool-cast.patch")
sha256sums=('be7794ed0cec42d6c682ca8e3517535b54555a3defabec83554dbc74db545ad5'
            '4a26322fdc31256a575df3d3056f09736c23291ab6c45704536d99b6e6c69d96')


prepare() {
  cd $srcdir/llvm-$pkgver.src
  mkdir build

  # Fix build with GCC >= 8.1 failing due to implicit cast no longer supported 
  patch -Np0 -i ../bool-cast.patch
  
  cd build

  CC=gcc CXX=g++ \
  ../configure --prefix=/opt/llvm37 \
               --enable-shared \
               --enable-optimized \
               --disable-bindings \
               --disable-jit \
               --disable-docs \
               --disable-assertions
}
 
build() {
  cd $srcdir/llvm-$pkgver.src/build
  make
}

# TODO: no tests because some tests currently fail
# Patch the code that makes them fail

package() {
  cd $srcdir/llvm-$pkgver.src/build
  make DESTDIR=$pkgdir install
  install -Dm644 $srcdir/llvm-$pkgver.src/LICENSE.TXT \
    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
