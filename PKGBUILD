# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target=loongarch64-linux-gnu
pkgname=$_target-gcc
pkgver=12.0.0.r185552.g14cdc0fc6a6
_islver=0.24
_pkgver=12.0.0
pkgrel=1
pkgdesc='Cross compiler for LoongArch 64-bit'
arch=('x86_64')
url='https://gcc.gnu.org/'
license=('GPL' 'LGPL' 'FDL')
groups=('loongarch')
depends=("$_target-binutils" "$_target-glibc" 'libmpc')
options=('!emptydirs' '!strip')
source=('git+https://github.com/loongson/gcc.git#branch=loongarch-12'
        http://isl.gforge.inria.fr/isl-${_islver}.tar.xz)
sha256sums=('SKIP'
            '043105cc544f416b48736fff8caf077fb0663a717d06b1113f16e391ac99ebad')

pkgver() {
	cd "$srcdir/gcc"
	printf "${_pkgver}.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd gcc

  # link isl for in-tree builds
  ln -sf ../isl-$_islver isl || true

  echo $pkgver > gcc/BASE-VER

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs LoongArch64 libraries /lib
  sed -i '/lib64/s/lib64/lib/' gcc/config/loongarch/t-linux
  sed -i "/GLIBC_DYNAMIC_LINKER_LP64.*lib64/s@lib64@usr/$_target/lib@" gcc/config/loongarch/gnu-user.h
  sed -i "/.*INT_ABI_SUFFIX \"lib64\"/s@lib64@usr/$_target/lib@" gcc/config/loongarch/linux.h

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" \
    "$srcdir/gcc/"{libiberty,gcc}/configure

  rm -rf "$srcdir/gcc-build"
  mkdir "$srcdir/gcc-build"
}

build() {
  cd gcc-build

  # Using -pipe causes spurious test-suite failures.
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  "$srcdir/gcc/configure" \
      --prefix=/usr \
      --program-prefix=$_target- \
      --with-local-prefix=/usr/$_target \
      --with-sysroot=/usr/$_target \
      --with-build-sysroot=/usr/$_target \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --target=$_target \
      --host=$CHOST \
      --build=$CHOST \
      --with-system-zlib \
      --with-isl \
      --with-linker-hash-style=gnu \
      --disable-nls \
      --disable-libunwind-exceptions \
      --disable-libstdcxx-pch \
      --disable-libssp \
      --enable-multilib \
      --disable-werror \
      --enable-languages=c,c++ \
      --enable-shared \
      --enable-threads=posix \
      --enable-__cxa_atexit \
      --enable-clocale=gnu \
      --enable-gnu-unique-object \
      --enable-linker-build-id \
      --enable-lto \
      --enable-plugin \
      --enable-install-libiberty \
      --enable-gnu-indirect-function \
      --enable-default-pie \
      --with-abi=lp64 \
      --enable-tls \
      --with-arch=loongarch64 \
      --with-fix-loongson3-llsc \
      --enable-checking=release
  make -j`nproc`
}

package() {
  make -C gcc-build DESTDIR="$pkgdir" \
    install-gcc install-target-libgcc install-target-libstdc++-v3

  # Strip target binaries
  find "$pkgdir/usr/lib/gcc/$_target/" "$pkgdir/usr/$_target/lib" -type f \
    -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy \
    -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames \
    -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str \
    -R .debug_ranges -R .debug_loc '{}' \;

  # Strip host binaries
  find "$pkgdir/usr/bin/" "$pkgdir/usr/lib/gcc/$_target/" -type f \
    -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir/usr/share/"{man/man7,info,"gcc-$pkgver"}
}

# vim: ts=2 sw=2 et:
