pkgname=psp-newlib
pkgver=4.1.0
pkgrel=1
pkgdesc="Newlib is a C library intended for use on embedded systems (psp)"
arch=(any)
url="https://github.com/pspdev/newlib"
license=('GPL')
makedepends=('psp-gcc-base' 'psp-binutils' 'git')
options=('!buildflags' '!strip' 'staticlibs')
source=("newlib-${pkgver}::git+https://github.com/pspdev/newlib.git#branch=allegrex-v${pkgver}")
sha256sums=('SKIP')

build()
{
  cd "$srcdir/newlib-${pkgver}"
  mkdir -p build-psp && cd build-psp
  ../configure --prefix=/usr --target=psp
  make 
}

package()
{
  cd "$srcdir/newlib-${pkgver}/build-psp"
  make install DESTDIR="$pkgdir"
  #rm -r "$pkgdir"/usr/share
  rm "$pkgdir"/usr/psp/lib/crt0.o # provided by psp-sdk
  rm "$pkgdir"/usr/psp/include/pthread.h "$pkgdir"/usr/psp/include/sched.h # provided by psp-pthread-embedded
  rm "$pkgdir"/usr/psp/include/sys/_pthreadtypes.h "$pkgdir"/usr/psp/include/sys/sched.h # provided by psp-pthread-embedded
}

