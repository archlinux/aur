# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target=loongarch64-linux-gnu
pkgname=$_target-gcc
pkgver=12.2.1
_pkgdate=20220911
pkgrel=1
pkgdesc='Cross compiler for LoongArch 64-bit'
arch=('x86_64')
url='https://gcc.gnu.org/'
license=('GPL' 'LGPL' 'FDL')
groups=('loongarch')
depends=("$_target-binutils" "$_target-glibc" 'libmpc' 'libisl' 'zstd')
options=('!emptydirs' '!strip' '!lto')
source=("https://github.com/yetist/gcc/releases/download/v${_pkgdate}/gcc-${pkgver}-${_pkgdate}.tar.xz")
sha256sums=('cbdf44fb512a626a3d8d3141fd20ea22737b738ca46e55f3c7af9195bdef11a7')

prepare() {
  cd gcc-$pkgver

  echo $pkgver > gcc/BASE-VER

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  rm -rf "$srcdir/gcc-build"
  mkdir "$srcdir/gcc-build"
}

build() {
  cd gcc-build

  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  # Using -pipe causes spurious test-suite failures.
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  "$srcdir/gcc-$pkgver/configure" \
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
      --disable-multilib \
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
      --enable-gnu-indirect-function \
      --enable-default-pie \
      --enable-checking=release \
      --enable-cet=auto \
      --enable-default-ssp \
      --disable-multiarch \
      --disable-multilib \
      --with-build-config=bootstrap-lto \
      --enable-link-serialization=1

  make -j`nproc`
}

package() {
  make -C gcc-build DESTDIR="$pkgdir" \
    install-gcc install-target-{libgcc,libstdc++-v3,libgomp,libgfortran,libquadmath,libatomic}

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

  ln -sf lib $pkgdir/usr/$_target/lib64
}

# vim: ts=2 sw=2 et:
