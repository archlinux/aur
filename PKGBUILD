# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Updated for MIPS64: Valentín Kivachuk <vk18496@gmail.com>

_target=mips64-linux-gnu
pkgname=$_target-gcc
pkgver=7.1.0
_islver=0.18
pkgrel=1
_snapshot=7-20170504
pkgdesc='The GNU Compiler Collection - cross compiler for MIPS64 target (Big Endian)'
arch=(i686 x86_64)
url='http://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils $_target-glibc libmpc zlib)
makedepends=(gmp mpfr)
options=(!emptydirs !strip)
source=(#ftp://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.bz2
        ftp://gcc.gnu.org/pub/gcc/snapshots/$_snapshot/gcc-$_snapshot.tar.bz2
        http://isl.gforge.inria.fr/isl-$_islver.tar.bz2)
sha256sums=('0a179b9fe8e90215d7b2385c40a2e36ba7f823193531847eb7fcff866df556ba'
            '6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b')

if [ -n "$_snapshot" ]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$pkgver
fi

prepare() {
  cd $_basedir

  # link isl for in-tree builds
  ln -sf ../isl-$_islver isl

  echo $pkgver > gcc/BASE-VER

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" "$srcdir"/$_basedir/{libiberty,gcc}/configure

  rm -rf $srcdir/gcc-build
  mkdir $srcdir/gcc-build
}

build() {
  cd gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  $srcdir/$_basedir/configure \
      --prefix=/usr \
      --program-prefix=$_target- \
      --with-local-prefix=/usr/$_target \
      --with-sysroot=/usr/$_target \
      --with-build-sysroot=/usr/$_target \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --target=$_target --host=$CHOST --build=$CHOST \
      --disable-nls \
      --enable-languages=c,c++ \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --with-isl --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-lto --enable-plugin --enable-install-libiberty \
      --with-linker-hash-style=gnu --enable-gnu-indirect-function \
      --disable-multilib --disable-werror \
      --enable-checking=release

  make
}

package() {
  cd gcc-build

  make DESTDIR="$pkgdir" install-gcc install-target-libgcc install-target-libstdc++-v3 

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/ "$pkgdir"/usr/$_target/lib -type f -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/ -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm -r "$pkgdir"/usr/share/gcc-$pkgver
}
