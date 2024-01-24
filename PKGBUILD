pkgname=psp-binutils
pkgver=2.37.0
pkgrel=2
pkgdesc="binutils with PSP patch applied (psp)"
arch=(x86_64)
url="https://github.com/pspdev/binutils-gdb"
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
  ../configure --quiet --prefix=/usr --target=psp --enable-plugins --disable-initfini-array --disable-werror --with-system-zlib --enable-deterministic-archives
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

