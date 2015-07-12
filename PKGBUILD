# Maintainer: Aurelien Martin <aurlienmartin@gmail.com>

_target=i686-elf
pkgname=$_target-gcc
pkgver=4.9.2
pkgrel=2
_gmpver=6.0.0a
_mpfrver=3.1.2
_mpcver=1.0.2
_islver=0.12.2
_cloogver=0.18.1
pkgdesc='The GNU Compiler Collection - cross compiler for i686-elf target'
arch=(i686 x86_64)
url='http://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils zlib)
options=(!emptydirs)
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.bz2
        https://gmplib.org/download/gmp/gmp-$_gmpver.tar.xz
        http://www.mpfr.org/mpfr-$_mpfrver/mpfr-$_mpfrver.tar.xz
        ftp://ftp.gnu.org/gnu/mpc/mpc-$_mpcver.tar.gz
        http://isl.gforge.inria.fr/isl-$_islver.tar.bz2
        http://www.bastoul.net/cloog/pages/download/cloog-$_cloogver.tar.gz)
sha256sums=('2020c98295856aa13fda0f2f3a4794490757fc24bcca918d52cc8b4917b972dd'
            '9156d32edac6955bc53b0218f5f3763facb890b73a835d5e1b901dcf8eb8b764'
            '399d0f47ef6608cc01d29ed1b99c7faff36d9994c45f36f41ba250147100453b'
            'b561f54d8a479cee3bc891ee52735f18ff86712ba30f036f8b8537bae380c488'
            'f4b3dbee9712850006e44f0db2103441ab3d13b406f77996d1df19ee89d11fb4'
            '02500a4edd14875f94fe84cbeda4290425cb0c1c2474c6f75d75a303d64b4196')

_basedir=gcc-$pkgver

prepare() {
  cd $_basedir
  
  # link gmp/mpfr/mpc for in-tree builds
  ln -s ../gmp-$_gmpver gmp
  ln -s ../mpfr-$_mpfrver mpfr
  ln -s ../mpc-$_mpcver mpc

  # link isl/cloog for in-tree builds
  ln -s ../isl-$_islver isl
  ln -s ../cloog-$_cloogver cloog

  echo $pkgver > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir $srcdir/gcc-build
}

build() {
  cd gcc-build

  $srcdir/$_basedir/configure \
    --target=$_target \
    --prefix=/usr \
    --enable-languages=c,c++ \
    --disable-tls \
    --without-headers \
    --with-system-zlib \
    --with-gmp \
    --with-mpfr \
    --with-mpc \
    --with-cloog \
    --with-isl \
    --enable-cloog-backend=isl

  make all-gcc
  make all-target-libgcc
}

check() {
  cd gcc-build

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || true
  $srcdir/$_basedir/contrib/test_summary
}

package() {
  cd gcc-build

  make DESTDIR="$pkgdir" install-gcc
  make DESTDIR="$pkgdir" install-target-libgcc

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm -r "$pkgdir"/usr/share/locale
}
