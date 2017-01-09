# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Martin Schmölzer <mschmoelzer@gmail.com>

_target=or1k-elf
pkgname=$_target-gcc
pkgver=6.0.0
_islver=0.18
pkgrel=1
_snapshot=20160327
pkgdesc='The GNU Compiler Collection - cross compiler for OpenRISC (bare-metal) target'
arch=(i686 x86_64)
url='http://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils zlib libmpc)
makedepends=(gmp mpfr $_target-newlib)
conflicts=($_target-gcc-stage1)
options=(!emptydirs !strip)
source=(https://github.com/openrisc/or1k-gcc/archive/or1k-$pkgver-$_snapshot.tar.gz
        http://isl.gforge.inria.fr/isl-$_islver.tar.bz2)
sha256sums=('03a3c1bf224cd468d2e65efb50c158dc984e5561caaa463a16e957c0f294241f'
            '6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b')

if [ -n "$_snapshot" ]; then
  _basedir=or1k-gcc-or1k-$pkgver-$_snapshot
else
  _basedir=gcc-$pkgver
fi

prepare() {
  cd $_basedir

  # link isl for in-tree builds
  ln -s ../isl-$_islver isl

  echo $pkgver > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir $srcdir/build-gcc{,-nano}
}

_build_gcc() {
  $srcdir/$_basedir/configure \
    --target=$_target \
    --prefix=/usr \
    --with-sysroot=/usr/$_target \
    --with-native-system-header-dir=/include \
    --libexecdir=/usr/lib \
    --enable-languages=c,c++ \
    --enable-plugins \
    --disable-decimal-float \
    --disable-libffi \
    --disable-libgomp \
    --disable-libmudflap \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libstdcxx-pch \
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --disable-tls \
    --with-gnu-as \
    --with-gnu-ld \
    --with-system-zlib \
    --with-newlib \
    --with-headers=/usr/$_target/include \
    --with-python-dir=share/gcc-$_target \
    --with-gmp \
    --with-mpfr \
    --with-mpc \
    --with-isl \
    --with-libelf \
    --enable-gnu-indirect-function \
    --with-host-libstdcxx='-static-libgcc -Wl,-Bstatic,-lstdc++,-Bdynamic -lm'

  make
}

build() {
  cd $srcdir/build-gcc
  export CFLAGS_FOR_TARGET='-g -Os'
  export CXXFLAGS_FOR_TARGET='-g -Os'
  _build_gcc

  # Build libstdc++ without exceptions support (the 'nano' variant)
  cd $srcdir/build-gcc-nano
  export CFLAGS_FOR_TARGET='-g -Os -fno-exceptions'
  export CXXFLAGS_FOR_TARGET='-g -Os -fno-exceptions'  
  _build_gcc
}

package() {
  cd $srcdir/build-gcc
  make DESTDIR="$pkgdir" install -j1

  cd $srcdir/build-gcc-nano
  make DESTDIR="$pkgdir.nano" install -j1
  # we need only libstdc nano files
  multilibs=( $($pkgdir/usr/bin/$_target-gcc -print-multi-lib 2>/dev/null) )
  for multilib in "${multilibs[@]}"; do
    dir="${multilib%%;*}"
    from_dir=$pkgdir.nano/usr/$_target/lib/$dir
    to_dir=$pkgdir/usr/$_target/lib/$dir
    cp -f $from_dir/libstdc++.a $to_dir/libstdc++_nano.a
    cp -f $from_dir/libsupc++.a $to_dir/libsupc++_nano.a
  done

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/$pkgver "$pkgdir"/usr/$_target/lib -type f -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/$pkgver -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/lib/libcc1.*
}
