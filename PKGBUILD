# Maintainer: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-unknown-elf
pkgname=$_target-gcc
pkgver=9.2.0
_islver=0.21
_newlibver=3.1.0.20181231
pkgrel=1
#_snapshot=7-20170504
pkgdesc='The GNU Compiler Collection - cross compiler for 32bit and 64bit RISC-V bare-metal'
arch=('i686' 'x86_64')
url='http://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=("$_target-binutils" 'zlib' 'libmpc')
options=(!emptydirs !strip)
source=("https://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.xz"
        "http://isl.gforge.inria.fr/isl-$_islver.tar.bz2"
        "https://sourceware.org/pub/newlib/newlib-$_newlibver.tar.gz")
sha256sums=('ea6ef08f121239da5695f76c9b33637a118dcf63e24164422231917fa61fb206'
            'd18ca11f8ad1a39ab6d03d3dcb3365ab416720fcb65b42d69f34f51bf0a0e859'
            '9e12fea7297648b114434033ed4458755afe7b9b6c7d58123389e82bd37681c0')

if [[ -n "$_snapshot" ]]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$pkgver
fi

prepare() {
  cd $_basedir

  # link isl for in-tree builds
  ln -s ../isl-$_islver isl

  # link newlib for in-tree builds
  for i in newlib libgloss; do
    ln -s ../newlib-$_newlibver/$i
  done

  echo $pkgver > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir "$srcdir/build"
}

build() {
  cd "$srcdir/build"

  export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'
  export CXXFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'

  "$srcdir/$_basedir/configure" \
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
    --with-host-libstdcxx='-static-libgcc -Wl,-Bstatic,-lstdc++,-Bdynamic -lm' \
    --with-pkgversion='Arch Repository' \
    --with-bugurl='https://bugs.archlinux.org/' \
    --disable-newlib-supplied-syscalls \
    --enable-newlib-reent-small \
    --disable-newlib-fvwrite-in-streamio \
    --disable-newlib-fseek-optimization \
    --disable-newlib-wide-orient \
    --enable-newlib-nano-malloc \
    --disable-newlib-unbuf-stream-opt \
    --enable-lite-exit \
    --enable-newlib-global-atexit \
    --enable-newlib-nano-formatted-io

  make INHIBIT_LIBC_CFLAGS='-DUSE_TM_CLONE_REGISTRY=0'
}

package() {
  cd "$srcdir/build"
  make -j1 DESTDIR="$pkgdir" install

  # strip target binaries
  find "$pkgdir/usr/lib/gcc/$_target/$pkgver" "$pkgdir/usr/$_target/lib" -type f -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir/usr/bin/" "$pkgdir/usr/lib/gcc/$_target/$pkgver" -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/lib/libcc1.*
}

# vim: set ts=2 sw=2 et:
