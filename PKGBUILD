pkgname=psp-gcc
pkgver=4.9.3
pkgrel=1
pkgdesc="The GNU Compiler Collection - C and C++ frontends (psp)"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('psp')
depends=('psp-binutils' 'psp-newlib' 'mpfr')
conflicts=('psp-gcc-base')
provides=('psp-gcc-base')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://ftp.gnu.org/pub/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.bz2"
        "gcc-$pkgver-PSP.patch"
        "https://gmplib.org/download/gmp/gmp-5.1.3.tar.lz"
        "https://ftp.gnu.org/gnu/mpc/mpc-1.0.2.tar.gz"
        "http://www.mpfr.org/mpfr-3.1.2/mpfr-3.1.2.tar.bz2"
        "patch-gcc_cp_cfns.h")
md5sums=('6f831b4d251872736e8e9cc09746f327'
         '472c84cce740a223420e186a35954fe4'
         'bdffbffc1fb4a7205f20acbdf18be28e'
         '68fadff3358fb3e7976c7a398a0af4c3'
         'ee2c3ac63bf0c2359bf08fc3ee094c19'
         'cc8bac293c0f0c6e127e7d242237f875')

prepare ()
{
  cd "$srcdir/gcc-$pkgver"
  rm -f gcc/config/mips/allegrex.md gcc/config/mips/psp.h libgcc/config/mips/t-allegrex
  patch -p1 -i "$srcdir"/gcc-$pkgver-PSP.patch
  patch -p0 -i "$srcdir"/patch-gcc_cp_cfns.h
  ln -sf "$srcdir"/gmp-5.1.3 gmp
  ln -sf "$srcdir"/mpc-1.0.2 mpc
  ln -sf "$srcdir"/mpfr-3.1.2 mpfr
}

build()
{
  cd "$srcdir/gcc-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr --target=psp \
    --enable-languages="c,c++" --enable-lto --with-newlib \
    --with-gmp-include="${PWD}/../gmp" --with-gmp-lib="${PWD}/gmp/.libs" \
    --with-mpfr-include="${PWD}/../mpfr/src" --with-mpfr-lib="${PWD}/mpfr/src/.libs" \
    --enable-cxx-flags="-G0"
  make 
}

package()
{
  cd "$srcdir/gcc-$pkgver/build-psp"
  make install DESTDIR="$pkgdir"
  rm -r "$pkgdir"/usr/share
}

