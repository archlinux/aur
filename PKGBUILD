# Maintainer: David P. <megver83@parabola.nu>

_target=xtensa-elf
pkgname=$_target-gcc
_pkgver=10.2.0
pkgver=$_pkgver
_islver=0.22
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for Xtensa (bare-metal) target'
arch=(x86_64 i686 armv7h)
url='http://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils libmpc zlib)
makedepends=(gmp mpfr)
options=(!emptydirs !strip)
source=(https://gcc.gnu.org/pub/gcc/releases/gcc-$_pkgver/gcc-$_pkgver.tar.xz{,.sig}
        http://isl.gforge.inria.fr/isl-$_islver.tar.bz2
        gcc.patch)
sha512sums=('42ae38928bd2e8183af445da34220964eb690b675b1892bbeb7cd5bb62be499011ec9a93397dba5e2fb681afadfc6f2767d03b9035b44ba9be807187ae6dc65e'
            'SKIP'
            'fc2c9796979610dd51143dcefe4f5c989c4354571cc5a1fcc6b932fd41f42a54f6b43adfd289af61be7bd06f3a523fa6a7d7ee56680e32d8036beb4c188fa668'
            '7637408259cef4b14a2f41690bbc769ad0dc6cf4d1c782405526aeb58f68193269af6882b23fb57c3521174e45709ed2d54f0af1f835646e70a3bfd9f626aad9')
validpgpkeys=(33C235A34C46AA3FFB293709A328C3A2C3C45C06  # Jakub Jelinek <jakub@redhat.com>
              13975A70E63C361C73AE69EF6EEB81F8981C74C7) # Richard Guenther <richard.guenther@gmail.com>
if [ -n "$_snapshot" ]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$_pkgver
fi

prepare() {
  cd $_basedir

  patch -Np1 -i ../gcc.patch

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
