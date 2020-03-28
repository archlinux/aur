# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Martin Schmölzer <mschmoelzer@gmail.com>

_target=riscv32-elf
pkgname=$_target-gcc
pkgver=9.3.0
_islver=0.22
pkgrel=1
#_snapshot=8-20180427
pkgdesc='The GNU Compiler Collection - cross compiler for RISCV32 (bare-metal) target'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils zlib libmpc)
makedepends=(gmp mpfr $_target-newlib)
optdepends=("$_target-newlib: Standard C library optimized for embedded systems")
options=(!emptydirs !strip)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
        #ftp://gcc.gnu.org/pub/gcc/snapshots/$_snapshot/gcc-$_snapshot.tar.xz
        http://isl.gforge.inria.fr/isl-$_islver.tar.bz2)
sha512sums=('4b9e3639eef6e623747a22c37a904b4750c93b6da77cf3958d5047e9b5ebddb7eebe091cc16ca0a227c0ecbd2bf3b984b221130f269a97ee4cc18f9cf6c444de'
            'SKIP'
            'fc2c9796979610dd51143dcefe4f5c989c4354571cc5a1fcc6b932fd41f42a54f6b43adfd289af61be7bd06f3a523fa6a7d7ee56680e32d8036beb4c188fa668')
validpgpkeys=(33C235A34C46AA3FFB293709A328C3A2C3C45C06) # Jakub Jelinek <jakub@redhat.com>

if [ -n "$_snapshot" ]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$pkgver
fi

prepare() {
  mkdir build-gcc

  cd $_basedir

  # link isl for in-tree builds
  ln -s ../isl-$_islver isl

  echo $pkgver > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
}

build() {
  cd build-gcc

  export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'
  export CXXFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'

  "$srcdir"/$_basedir/configure \
    --target=$_target \
    --prefix=/usr \
    --with-sysroot=/usr/$_target \
    --with-native-system-header-dir=/include \
    --libexecdir=/usr/lib \
    --enable-languages=c,c++ \
    --enable-threads=single \
    --enable-plugins \
    --enable-multilib \
    --enable-libgcc \
    --disable-libgomp \
    --disable-libquadmath \
    --disable-libffi \
    --disable-libssp \
    --disable-libmudflap \
    --disable-decimal-float \
    --disable-libstdcxx-pch \
    --disable-nls \
    --disable-shared \
    --disable-tls \
    --with-newlib \
    --with-gnu-as \
    --with-gnu-ld \
    --with-system-zlib \
    --with-headers=/usr/$_target/include \
    --with-python-dir=share/gcc-$_target \
    --with-gmp \
    --with-mpfr \
    --with-mpc \
    --with-isl \
    --with-libelf \
    --enable-gnu-indirect-function \
    --with-pkgversion="Arch Linux Repositories" \
    --with-bugurl='https://bugs.archlinux.org/'

  make
}

package() {
  cd build-gcc

  make DESTDIR="$pkgdir" install -j1

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/$pkgver "$pkgdir"/usr/$_target/lib \
       -type f -and \( -name \*.a -or -name \*.o \) \
       -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges \
       -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
       -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/$pkgver -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/lib/libcc1.*
}

