# Maintainer: David P. <megver83@parabola.nu>

_target=arm-linux-gnueabi
pkgname=$_target-gcc
_pkgver=13.2.0
pkgver=$_pkgver
_islver=0.26
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for ARM GNU EABI little-endian target'
arch=(x86_64 i686 armv7h)
url='http://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils libmpc zlib)
makedepends=(gmp mpfr)
options=(!emptydirs !strip)
source=(https://gcc.gnu.org/pub/gcc/releases/gcc-$_pkgver/gcc-$_pkgver.tar.xz{,.sig}
        https://libisl.sourceforge.io/isl-$_islver.tar.bz2)
validpgpkeys=(D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62)  # Jakub Jelinek <jakub@redhat.com>

if [ -n "$_snapshot" ]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$_pkgver
fi

prepare() {
  cd $_basedir

  # link isl for in-tree builds
  ln -sf ../isl-$_islver isl

  echo $_pkgver > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" "$srcdir"/$_basedir/{libiberty,gcc}/configure

  mkdir $srcdir/gcc-build
}

build() {
  cd gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  export CFLAGS=${CFLAGS/-Werror=format-security/}
  export CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  $srcdir/$_basedir/configure \
    --target=$_target \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-languages=c,c++ \
    --enable-plugins \
    --enable-shared \
    --disable-decimal-float \
    --disable-libffi \
    --disable-libgomp \
    --disable-libmudflap \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libstdcxx-pch \
    --disable-nls \
    --disable-threads \
    --disable-tls \
    --disable-multilib \
    --with-gnu-as \
    --with-gnu-ld \
    --with-system-zlib \
    --with-gmp \
    --with-mpfr \
    --with-mpc \
    --with-isl \
    --with-libelf \
    --enable-gnu-indirect-function

  make all-gcc
}

package() {
  make -C gcc-build DESTDIR="$pkgdir" install-gcc

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/ \
       -type f -and \( -name \*.a -or -name \*.o \) \
       -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges \
           -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
           -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir/usr/bin/" "$pkgdir/usr/lib/gcc/$_target/" -type f \
    -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir/usr/share/"{man/man7,info}
}
sha256sums=('e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da'
            'SKIP'
            '5eac8664e9d67be6bd0bee5085d6840b8baf738c06814df47eaf4166d9776436')

