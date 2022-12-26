# Maintainer: Pellegrino Prevete < pellegrinoprevete at gmail dot com >
# Contributor: Georgios Kourachanis < geo dot kourachanis at gmail dot com >
# Contributor: Anatol Pomozov < anatol dot pomozov at gmail dot com > (arm-none-eabi-gcc)
# Contributor: Martin Schmölzer < mschmoelzer at gmail dot com > (arm-none-eabi-gcc)

_target="arm-none-eabi"
_pkgbase="gcc"
pkgname="${_target}-${_pkgbase}55"
pkgver=5.5.0
_islver=0.24
pkgrel=1
# _snapshot=7-20170907
pkgdesc='The GNU Compiler Collection - cross compiler for ARM EABI (bare-metal) target'
arch=(i686 x86_64)
_domain="${_pkgbase}.gnu.org"
url="http://${_domain}"
_ftp_url="ftp://${_domain}/pub/${_pkgbase}"
license=(GPL LGPL FDL)
depends=("${_target}-binutils" "zlib" "libmpc")
makedepends=("gmp" "mpfr" "${_target}-newlib")
provides=("${_target}-gcc")
conflicts=("${_target}-gcc")
optdepends=("${_target}-newlib: Standard C library optimized for embedded systems")
options=(!emptydirs !strip)
source=("ftp://${_pkgbase_url}/releases/${_pkgbase}-${pkgver}/${_pkgbase}-${pkgver}.tar.xz"
        # "ftp://${_pkgbase_url}/snapshots/${_snapshot}/${_pkgbase}-${_snapshot}.tar.xz"
        "https://${_pkgbase_url}/infrastructure/isl-${_islver}.tar.bz2"
        "enable-with-multilib-list-for-arm.patch")
sha512sums=('670ff52c2ae12c7852c12987e91798c5aa8bd6daf21f0d6e0cd57a4aa59cc4f06a837fe76426eaa1424cfddca937bed377680700eadc04d76b9180d462364fa1'
            '85d0b40f4dbf14cb99d17aa07048cdcab2dc3eb527d2fbb1e84c41b2de5f351025370e57448b63b2b8a8cf8a0843a089c3263f9baee1542d5c2e1cb37ed39d94'
            '4831a862a0ee50918297f35da48919f326ad9e8b3a2a97d4b130e08c0e781a0e6c44e918d2618ba73be2ce0f8d0365b063ed5650a4bd8a5e26ee37a78647b2d2')

if [ -n "$_snapshot" ]; then
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

  patch -p1 < $srcdir/enable-with-multilib-list-for-arm.patch

  mkdir $srcdir/build-{gcc,gcc-nano}
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
    --with-python-dir=share/gcc-arm-none-eabi \
    --with-gmp \
    --with-mpfr \
    --with-mpc \
    --with-isl \
    --with-libelf \
    --enable-gnu-indirect-function \
    --with-host-libstdcxx='-static-libgcc -Wl,-Bstatic,-lstdc++,-Bdynamic -lm' \
    --with-pkgversion='Arch Repository' \
    --with-bugurl='https://bugs.archlinux.org/' \
    --with-multilib-list=armv6-m,armv7-m,armv7e-m,armv7-r

  make INHIBIT_LIBC_CFLAGS='-DUSE_TM_CLONE_REGISTRY=0'
}

build() {
  cd $srcdir/build-gcc
  export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'
  export CXXFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'
  _build_gcc

  # Build libstdc++ without exceptions support (the 'nano' variant)
  cd $srcdir/build-gcc-nano
  export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections -fno-exceptions'
  export CXXFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections -fno-exceptions'  
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
