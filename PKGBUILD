pkgname=psp-binutils
pkgver=2.37.0
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (psp)"
arch=(x86_64)
url="https://www.gnu.org/software/binutils/"
license=('GPL')
depends=('glibc' 'libelf' 'zlib' 'python')
makedepends=('git')
options=('!buildflags' '!strip' 'staticlibs')
source=(binutils-$pkgver::git+https://github.com/pspdev/binutils-gdb.git#branch=allegrex-v${pkgver})
sha256sums=('SKIP')

build()
{
  cd "$srcdir/binutils-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr --target=psp --enable-plugins --disable-werror --with-system-zlib --enable-deterministic-archives
  make 
}

package()
{
  cd "$srcdir/binutils-$pkgver/build-psp"
  make install DESTDIR="$pkgdir"
  rm -r "$pkgdir"/usr/share
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so
  rm "$pkgdir"/usr/include/gdb/jit-reader.h
}

