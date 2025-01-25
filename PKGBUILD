pkgname=psp-newlib
pkgver=4.4.0
pkgrel=1
pkgdesc="A fork of newlib for the PSP (psp)"
arch=(any)
url="https://github.com/pspdev/newlib"
license=('GPL')
makedepends=('psp-gcc-base' 'psp-binutils' 'git')
options=('!buildflags' '!strip' 'staticlibs')

prepare()
{
  rm -rf "$srcdir/newlib-${pkgver}"
  git clone https://github.com/pspdev/newlib.git -b allegrex-v${pkgver} --depth 1 "$srcdir/newlib-${pkgver}"
}

build()
{
  cd "$srcdir/newlib-${pkgver}"
  mkdir -p build-psp && cd build-psp
  ../configure \
    --prefix=/usr \
    --target=psp \
    --enable-newlib-retargetable-locking \
    --enable-newlib-multithread \
    --enable-newlib-io-c99-formats \
    --enable-newlib-iconv \
    --enable-newlib-iconv-encodings=us_ascii,utf8,utf16,ucs_2_internal,ucs_4_internal,iso_8859_1
  make 
}

package()
{
  cd "$srcdir/newlib-${pkgver}/build-psp"
  make install DESTDIR="$pkgdir"
  rm "$pkgdir"/usr/psp/lib/crt0.o # provided by psp-sdk
  rm "$pkgdir"/usr/psp/include/pthread.h "$pkgdir"/usr/psp/include/sched.h # provided by psp-pthread-embedded
  rm "$pkgdir"/usr/psp/include/sys/_pthreadtypes.h "$pkgdir"/usr/psp/include/sys/sched.h # provided by psp-pthread-embedded
}
