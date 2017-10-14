# Maintainer: Georgios Kourachanis < geo dot kourachanis at gmail dot com >
# Contributor: Anatol Pomozov < anatol dot pomozov at gmail dot com > (aarch64-linux-gnu-gcc)

_target=aarch64-linux-gnu
pkgname=$_target-gcc55
pkgver=5.5.0
_islver=0.18
pkgrel=1
# _snapshot=6-20171011
pkgdesc='The GNU Compiler Collection - cross compiler for ARM64 target'
arch=(i686 x86_64)
url='http://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils $_target-glibc libmpc zlib)
makedepends=(gmp mpfr)
provides=('aarch64-linux-gnu-gcc')
conflicts=('aarch64-linux-gnu-gcc')
options=(!emptydirs !strip)
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.xz
        #ftp://gcc.gnu.org/pub/gcc/snapshots/$_snapshot/gcc-$_snapshot.tar.xz
        http://isl.gforge.inria.fr/isl-$_islver.tar.bz2)
sha512sums=('670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1'
            '85d0b40f4dbf14cb99d17aa07048cdcab2dc3eb527d2fbb1e84c41b2de5f351025370e57448b63b2b8a8cf8a0843a089c3263f9baee1542d5c2e1cb37ed39d94')

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
