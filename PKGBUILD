# Maintainer: Maxr1998 <aur@maxr1998.de>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-unknown-elf
pkgname=$_target-gcc
pkgver=13.2.0
_islver=0.26
pkgrel=2
#_snapshot=7-20170504
pkgdesc='The GNU Compiler Collection - cross compiler for 32bit and 64bit RISC-V bare-metal'
arch=('i686' 'x86_64')
url='http://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=("$_target-binutils" 'zlib' 'libmpc')
options=(!emptydirs !strip)
source=("https://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.xz"
        "https://libisl.sourceforge.io/isl-$_islver.tar.xz")
sha256sums=('e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da'
            'a0b5cb06d24f9fa9e77b55fabbe9a3c94a336190345c2555f9915bb38e976504')

if [[ -n "$_snapshot" ]]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$pkgver
fi

prepare() {
  cd $_basedir

  # link isl for in-tree builds
  ln -sf ../isl-$_islver isl

  echo $pkgver > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"

  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
  # TODO: properly deal with the build issues resulting from this
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

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
    --disable-werror \
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
