pkgname=psp-newlib
pkgver=1.20.0
pkgrel=1
pkgdesc="Newlib is a C library intended for use on embedded systems (psp)"
arch=(any)
url="https://github.com/pspdev/newlib"
license=('GPL')
groups=('psp')
makedepends=('psp-gcc-base' 'psp-binutils' 'psp-sdk-base')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/pspdev/newlib/archive/newlib-${pkgver//./_}-PSP.zip")
sha256sums=('SKIP')

build()
{
  cd "$srcdir/newlib-newlib-${pkgver//./_}-PSP"
  mkdir -p build-psp && cd build-psp
  ../configure --prefix=/usr --target=psp --enable-newlib-iconv --enable-newlib-multithread --enable-newlib-mb 
  make 
}

package()
{
  cd "$srcdir/newlib-newlib-${pkgver//./_}-PSP/build-psp"
  make install DESTDIR="$pkgdir"
  rm -r "$pkgdir"/usr/share
  rm "$pkgdir"/usr/psp/lib/crt0.o # provided by psp-sdk
  rm "$pkgdir"/usr/psp/include/pthread.h "$pkgdir"/usr/psp/include/sched.h  # provided by psp-pthreads-emb
}

