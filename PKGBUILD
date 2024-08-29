# Maintainer: Jaap Aarts Berthing <jaap.aarts1@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-linux-uclibc
pkgname=$_target-gcc
pkgver=14.2.0
pkgrel=1
pkgdesc='Cross compiler for 32-bit and 64-bit RISC-V'
arch=('x86_64')
url='https://gcc.gnu.org/'
license=(GPL3-3.0-with-GCC-exception GFDL-1.3-or-later)
depends=("$_target-binutils" "$_target-uclibcng" 'libmpc' 'libisl' 'zstd')
options=('!emptydirs' '!strip' '!lto')
source=("https://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.xz")
sha512sums=('SKIP')

if [[ -n "$_snapshot" ]]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$pkgver
fi

prepare() {
  cd $_basedir

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

  CFLAGS_FOR_TARGET="-march=rv64imafd" ASFLAGS_FOR_TARGET="-march=rv64imafd" LDSFLAGS_FOR_TARGET="-march=rv64imafd" "$srcdir/$_basedir/configure" \
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
      --with-arch=rv64imafd \
      --disable-nls \
      --disable-libunwind-exceptions \
      --disable-libstdcxx-pch \
      --disable-shared \
      --disable-libssp \
      --disable-multilib \
      --disable-werror \
      --disable-threads \
      --disable-libatomic \
      --disable-libgomp \
      --disable-libsanitizer \
      --disable-libitm \
      --enable-languages=c,c++ \
      --enable-__cxa_atexit \
      --enable-clocale=gnu \
      --enable-gnu-unique-object \
      --enable-lto \
      --enable-plugin \
      --enable-install-libiberty \
      --enable-gnu-indirect-function \
      --enable-checking=release \
      --enable-static

  # setting --enable-linker-build-id creates incompatible binaries that are not linkable with elf2flt
  # --default-pie also gave errors
  # pthread is not suported by uclibc on flat binaries
  # atomic needs pthread, same as gomp
  # libsanitizer needs dlfnc.h

  make
}

package() {
  make -C gcc-build DESTDIR="$pkgdir" \
    install-gcc install-target-{libgcc,libstdc++-v3,libgfortran,libquadmath}

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
  rm -r "$pkgdir/usr/share/"{man/man7,info,gcc-$pkgver}
}

# vim: ts=2 sw=2 et:
