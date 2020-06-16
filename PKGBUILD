pkgname=psp-gdb
pkgver=7.5.1
pkgrel=1
pkgdesc="The GNU Debugger (psp)"
arch=(any)
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
groups=('psp')
depends=('psp-sdk')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://ftp.gnu.org/pub/gnu/gdb/gdb-$pkgver.tar.bz2" 
        "gdb-$pkgver-fixes.patch"
        "gdb-$pkgver-PSP.patch")
md5sums=('SKIP'
         'SKIP' 'SKIP')

prepare ()
{
  cd "$srcdir/gdb-$pkgver"
  patch -p1 -i "$srcdir"/gdb-$pkgver-PSP.patch
  patch -p1 -i "$srcdir"/gdb-$pkgver-fixes.patch
}

build()
{
  cd "$srcdir/gdb-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr --target=psp \
    --disable-werror --disable-nls \
    --with-system-zlib --with-system-readline 
  make 
}

package()
{
  cd "$srcdir/gdb-$pkgver/build-psp"
  make install DESTDIR="$pkgdir"
  rm -r "$pkgdir"/usr/share
  rm -r "$pkgdir"/usr/lib
}

