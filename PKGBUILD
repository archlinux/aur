# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: shad0w73 <shad0w73@freenet.de>

_basename=gperftools
pkgname=lib32-$_basename
pkgver=2.5
pkgrel=1
pkgdesc="Fast, multi-threaded malloc and nifty performance analysis tools (32-bit)"
arch=('x86_64')
url="https://github.com/gperftools/gperftools"
license=('BSD')
depends=('gperftools' 'lib32-gcc-libs')
provides=('libtcmalloc.so'
          'libprofiler.so'
          'libtcmalloc_debug.so'
          'libtcmalloc_and_profiler.so'
          'libtcmalloc_minimal.so'
          'libtcmalloc_minimal_debug.so')
makedepends=('gcc-multilib' 'git')
source=("git+https://github.com/gperftools/gperftools#tag=$_basename-$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$_basename"

    ./autogen.sh
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'

  cd "$_basename"

  ./configure --prefix=/usr --libdir=/usr/lib32 --enable-frame-pointers
  make
}

package() {
  cd "$_basename"

  # not needed in 32-bit package
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{bin,include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_basename "$pkgdir/usr/share/licenses/$pkgname"
}
