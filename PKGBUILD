# Maintainer: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-unknown-elf
pkgname=$_target-gcc
pkgver=9.2.0
_islver=0.21
pkgrel=2
#_snapshot=7-20170504
pkgdesc='The GNU Compiler Collection - cross compiler for 32bit and 64bit RISC-V bare-metal'
arch=('i686' 'x86_64')
url='http://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=("$_target-binutils" 'zlib' 'libmpc')
options=(!emptydirs !strip)
source=("https://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.xz"
        "http://isl.gforge.inria.fr/isl-$_islver.tar.bz2")
sha256sums=('ea6ef08f121239da5695f76c9b33637a118dcf63e24164422231917fa61fb206'
            'd18ca11f8ad1a39ab6d03d3dcb3365ab416720fcb65b42d69f34f51bf0a0e859')

if [[ -n "$_snapshot" ]]; then
  _basedir=gcc-$_snapshot
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

  mkdir "$srcdir/build"
}

build() {
  cd "$srcdir/build"

  "$srcdir/$_basedir/configure" \
    CFLAGS_FOR_TARGET='-Os -mcmodel=medany -ffunction-sections -fdata-sections' \
    CXXFLAGS_FOR_TARGET='-Os -mcmodel=medany -ffunction-sections -fdata-sections' \
    --target=$_target \
    --prefix=/usr \
    --with-sysroot=/usr/$_target \
    --with-native-system-header-dir=/include \
    --libexecdir=/usr/lib \
    --enable-languages=c,c++ \
    --enable-plugins \
    --enable-multilib \
    --disable-decimal-float \
    --disable-libffi \
    --enable-checking=yes \
    --disable-libgomp \
    --disable-libmudflap \
    --disable-libquadmath \
    --disable-libssp \
    --disable-libstdcxx-pch \
    --disable-libstdcxx \
    --disable-fixinc \
    --disable-nls \
    --disable-shared \
    --disable-threads \
    --enable-tls \
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
    --with-arch=rv64imafdc \
    --with-abi=lp64d \
    --with-pkgversion='Arch User Repository'

  make INHIBIT_LIBC_CFLAGS='-DUSE_TM_CLONE_REGISTRY=0'
}

package() {
  cd "$srcdir/build"
  make -j1 DESTDIR="$pkgdir" install

  # strip host binaries
  find "$pkgdir/usr/bin/" "$pkgdir/usr/lib/gcc/$_target/$pkgver" -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/lib/libcc1.*
}

# vim: set ts=2 sw=2 et:
