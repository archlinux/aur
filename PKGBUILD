# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target=loongarch64-linux-gnu
pkgname=$_target-gcc
pkgver=15.2.0
pkgrel=1
pkgdesc='Cross compiler for LoongArch 64-bit'
arch=('x86_64')
url='https://gcc.gnu.org/'
license=('GPL' 'LGPL' 'FDL')
groups=('loongarch')
depends=(
  "$_target-binutils"
  "$_target-glibc"
  'gcc-libs'
  'glibc'
  'gmp'
  'libisl' 'libisl.so'
  'libmpc'
  'mpfr' 'libmpfr.so'
  'zlib' 'libz.so'
  'zstd' 'libzstd.so'
)
options=('!emptydirs' '!strip' staticlibs '!lto')
source=("https://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.xz")
sha256sums=('438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e')

prepare() {
  cd gcc-$pkgver

  echo $pkgver >gcc/BASE-VER

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
    --with-native-system-header-dir=/include \
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
    --enable-install-libiberty \
    --enable-gnu-indirect-function \
    --enable-default-pie \
    --enable-checking=release
  make -j$(nproc)
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
