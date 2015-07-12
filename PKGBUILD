pkgname=psp-newlib
pkgver=1.20.0
pkgrel=1
pkgdesc="Newlib is a C library intended for use on embedded systems (psp)"
arch=(any)
url="http://sourceware.org/newlib/"
license=('GPL')
groups=('psp')
makedepends=('psp-gcc-base' 'psp-binutils' 'psp-sdk-base')
options=('!buildflags' '!strip' 'staticlibs')
source=("ftp://sourceware.org/pub/newlib/newlib-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/pspdev/psptoolchain/master/patches/newlib-$pkgver-PSP.patch")
md5sums=('e5488f545c46287d360e68a801d470e8'
         'a4c92e3212937ced1f6aa9130331c1b1')

prepare ()
{
  cd "$srcdir/newlib-$pkgver"
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

