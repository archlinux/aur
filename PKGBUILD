# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: shad0w73 <shad0w73@freenet.de>

_basename=gperftools
pkgname=lib32-$_basename
pkgver=2.10
pkgrel=1
pkgdesc="Fast, multi-threaded malloc and nifty performance analysis tools (32-bit)"
arch=('x86_64')
url="https://github.com/gperftools/gperftools"
license=('BSD')
depends=('gperftools' 'lib32-gcc-libs' 'lib32-libunwind')
provides=('libtcmalloc.so'
          'libprofiler.so'
          'libtcmalloc_debug.so'
          'libtcmalloc_and_profiler.so'
          'libtcmalloc_minimal.so'
          'libtcmalloc_minimal_debug.so')
source=(https://github.com/gperftools/gperftools/releases/download/$_basename-$pkgver/$_basename-$pkgver.tar.gz)
sha256sums=('83e3bfdd28b8bcf53222c3798d4d395d52dadbbae59e8730c4a6d31a9c3732d8')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'

  cd "$_basename-$pkgver"

  ./configure \
      --prefix=/usr \
      --libdir=/usr/lib32 \
      --enable-frame-pointers \
      --enable-libunwind
  make
}

package() {
  cd "$_basename-$pkgver"

  # not needed in 32-bit package
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{bin,include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_basename "$pkgdir/usr/share/licenses/$pkgname"
}
