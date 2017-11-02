pkgname=psp-newlib
pkgver=1.20.0
pkgrel=2
pkgdesc="Newlib is a C library intended for use on embedded systems (psp)"
arch=(any)
url="http://sourceware.org/newlib/"
license=('GPL')
groups=('psp')
makedepends=('psp-gcc-base' 'psp-binutils' 'psp-sdk-base')
options=('!buildflags' '!strip' 'staticlibs')
source=("ftp://sourceware.org/pub/newlib/newlib-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/pspdev/psptoolchain/master/patches/newlib-$pkgver-PSP.patch")
sha256sums=('c644b2847244278c57bec2ddda69d8fab5a7c767f3b9af69aa7aa3da823ff692'
            '43630dd12c0148d035a00daa0665b67122cf40bdf2fc587a9db40cb7deeb7dbf')

prepare ()
{
  cd "$srcdir/newlib-$pkgver"
  rm -f newlib/libc/include/memory.h
  rm -rf newlib/libc/sys/psp/
  patch -p1 -i "$srcdir"/newlib-$pkgver-PSP.patch
}

build()
{
  cd "$srcdir/newlib-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr --target=psp --enable-newlib-iconv --enable-newlib-multithread --enable-newlib-mb 
  make 
}

package()
{
  cd "$srcdir/newlib-$pkgver/build-psp"
  make install DESTDIR="$pkgdir"
  rm -r "$pkgdir"/usr/share
  rm "$pkgdir"/usr/psp/lib/crt0.o # provided by psp-sdk
}

