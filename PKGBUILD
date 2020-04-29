pkgname=psp-gcc-base
pkgver=9.3.0
pkgrel=1
pkgdesc="The GNU Compiler Collection - C and C++ frontends (bootstrap) (psp)"
arch=('x86_64')
url="https://github.com/pspdev/psptoolchain"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('psp')
depends=('mpfr')
makedepends=('psp-binutils')
conflicts=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.gz"
        "https://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.bz2"
        "https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz"
        "http://www.mpfr.org/mpfr-4.0.2/mpfr-4.0.2.tar.bz2"
        "http://isl.gforge.inria.fr/isl-0.21.tar.gz")
sha256sums=('5258a9b6afe9463c2e56b9e8355b1a4bee125ca828b8078f910303bc2ef91fa6'
            '5275bb04f4863a13516b2f39392ac5e272f5e1bb8057b18aec1c9b79d73d8fb2'
            '6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e'
            'c05e3f02d09e0e9019384cdd58e0f19c64e6db1fd6f5ecf77b4b1c61ca253acc'
            '6d670e6b90ef220c80f79e538aa512e9eda77214058d668c77931143dc9374a2')

prepare ()
{
  cd "$srcdir/gcc-$pkgver"
  rm -f gcc/config/mips/allegrex.md gcc/config/mips/psp.h libgcc/config/mips/psp.h gcc/config/mips/t-allegrex libgcc/config/mips/t-allegrex libgcc/config/t-hardfp-sf
  curl -L https://raw.githubusercontent.com/pspdev/psptoolchain/master/patches/gcc-$pkgver-PSP.patch | patch -p1
  ln -sf "$srcdir"/gmp-6.1.2 gmp
  ln -sf "$srcdir"/mpc-1.1.0 mpc
  ln -sf "$srcdir"/mpfr-4.0.2 mpfr
  ln -sf "$srcdir"/isl-0.21 isl
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

  # Remove files owned by host gcc
  rm -r "$pkgdir"/usr/share
  rm "$pkgdir"/usr/lib/libcc1.*
}

