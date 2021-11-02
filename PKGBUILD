pkgname=psp-gcc
pkgver=9.3.0
pkgrel=1
pkgdesc="The GNU Compiler Collection - C and C++ frontends (psp)"
arch=('x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('psp')
depends=('psp-binutils' 'psp-newlib' 'mpfr')
conflicts=('psp-gcc-base')
provides=('psp-gcc-base')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.gz"
        "gcc-$pkgver-PSP.patch"
        "https://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.bz2"
        "https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz"
        "http://www.mpfr.org/mpfr-4.0.2/mpfr-4.0.2.tar.bz2"
        "https://github.com/Meinersbur/isl/archive/refs/tags/isl-0.21.tar.gz")
#        "http://isl.gforge.inria.fr/isl-0.21.tar.gz")
sha256sums=('5258a9b6afe9463c2e56b9e8355b1a4bee125ca828b8078f910303bc2ef91fa6'
            '7f77adb02c8300ff5a61306228015340963e33b49a41772d7a265922d73a9fec'
            '5275bb04f4863a13516b2f39392ac5e272f5e1bb8057b18aec1c9b79d73d8fb2'
            '6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e'
            'c05e3f02d09e0e9019384cdd58e0f19c64e6db1fd6f5ecf77b4b1c61ca253acc' SKIP)
#            '6d670e6b90ef220c80f79e538aa512e9eda77214058d668c77931143dc9374a2')

prepare ()
{
  cd "$srcdir/gcc-$pkgver"
  rm -f gcc/config/mips/allegrex.md gcc/config/mips/psp.h libgcc/config/mips/t-allegrex gcc/config/mips/t-allegrex libgcc/config/mips/psp.h libgcc/config/t-hardfp-sf
  patch -p1 -i "$srcdir"/gcc-$pkgver-PSP.patch
  ln -sf "$srcdir"/gmp-6.1.2 gmp
  ln -sf "$srcdir"/mpc-1.1.0 mpc
  ln -sf "$srcdir"/mpfr-4.0.2 mpfr
  ln -sf "$srcdir"/isl-0.21 isl
}

build()
{
  cd "$srcdir/gcc-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr --target=psp --enable-languages="c,c++" \
    --enable-lto --with-newlib --enable-cxx-flags="-G0" \
    --with-gmp-include="${PWD}/../gmp" --with-gmp-lib="${PWD}/gmp/.libs" \
    --with-mpfr-include="${PWD}/../mpfr/src" --with-mpfr-lib="${PWD}/mpfr/src/.libs"
  make 
}

package()
{
  cd "$srcdir/gcc-$pkgver/build-psp"
  make install DESTDIR="$pkgdir"

  # Remove files owned by host gcc
  rm -r "$pkgdir"/usr/share
  rm "$pkgdir"/usr/lib/libcc1.*
}

