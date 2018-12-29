pkgname=psp-gcc-base
pkgver=4.9.3
pkgrel=1
pkgdesc="The GNU Compiler Collection - C and C++ frontends (bootstrap) (psp)"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('psp')
depends=('mpfr')
makedepends=('psp-binutils')
conflicts=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://ftp.gnu.org/pub/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.bz2"
        "https://gmplib.org/download/gmp/gmp-5.1.3.tar.lz"
        "https://ftp.gnu.org/gnu/mpc/mpc-1.0.2.tar.gz"
        "http://www.mpfr.org/mpfr-3.1.2/mpfr-3.1.2.tar.bz2")
sha256sums=('2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e'
            '9a6bde619a9dcdcb68a856be1b32a097a2a04fec2ce6d6fe0877d941f9309c50'
            'b561f54d8a479cee3bc891ee52735f18ff86712ba30f036f8b8537bae380c488'
            '79c73f60af010a30a5c27a955a1d2d01ba095b72537dab0ecaad57f5a7bb1b6b')

prepare ()
{
  cd "$srcdir/gcc-$pkgver"
  rm -f gcc/config/mips/allegrex.md gcc/config/mips/psp.h libgcc/config/mips/psp.h gcc/config/mips/t-allegrex libgcc/config/mips/t-allegrex
  curl -L https://raw.githubusercontent.com/pspdev/psptoolchain/master/patches/gcc-$pkver-PSP.patch | patch -p1
  ln -sf "$srcdir"/gmp-5.1.3 gmp
  ln -sf "$srcdir"/mpc-1.0.2 mpc
  ln -sf "$srcdir"/mpfr-3.1.2 mpfr
}

build()
{
  cd "$srcdir/gcc-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr --target=psp \
    --enable-languages="c" --enable-lto --with-newlib \
    --with-gmp-include="${PWD}/../gmp" --with-gmp-lib="${PWD}/gmp/.libs" \
    --with-mpfr-include="${PWD}/../mpfr/src" --with-mpfr-lib="${PWD}/mpfr/src/.libs" \
    --without-headers --disable-libssp
  make 
}

package()
{
  cd "$srcdir/gcc-$pkgver/build-psp"
  make install DESTDIR="$pkgdir"
  rm -r "$pkgdir"/usr/share
}

