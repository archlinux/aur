# Maintainer: Nicolas Farmer <nicolas dot farmer at proton dot me>

_target=ia64-linux-gnu
pkgname="${_target}-gcc"
pkgver=14.1.0
pkgrel=1
pkgdesc='The GNU Compiler Collection (ia64) (for the toolchain with GNU C library)'
arch=('any')
url='https://gcc.gnu.org/'
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('gmp' 'libmpc' "${_target}-binutils" "${_target}-glibc" 'libisl' 'mpfr' 'sh' 'zlib' 'zstd')
makedepends=("${_target}-linux-api-headers")
provides=("${pkgname}-bootstrap")
conflicts=("${pkgname}-bootstrap")
source=(https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz{,.sig})
sha256sums=('e283c654987afe3de9d8080bc0bd79534b5ca0d681a73a11ff2b5d3767426840'
            'SKIP')
validpgpkeys=('D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62') # Jakub Jelinek <jakub@redhat.com>

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
  export CFLAGS=${CFLAGS/-pipe/}
  export CXXFLAGS=${CXXFLAGS/-pipe/}

  "${srcdir}/gcc-${pkgver}/configure" \
      --build="$CHOST" \
      --host="$CHOST" \
      --target="$_target" \
      --prefix='/usr' \
      --libdir='/usr/lib' \
      --libexecdir='/usr/lib' \
      --mandir='/usr/share/man' \
      --with-sysroot="/usr/${_target}" \
      --with-build-sysroot="/usr/${_target}" \
      --with-native-system-header-dir='/include' \
      --with-gnu-as \
      --with-gnu-ld \
      --enable-languages='c,c++,fortran' \
      --with-isl \
      --with-linker-hash-style='gnu' \
      --with-system-zlib \
      --enable-__cxa_atexit \
      --enable-cet='auto' \
      --enable-checking='release' \
      --enable-clocale='gnu' \
      --enable-default-ssp \
      --enable-gnu-indirect-function \
      --enable-gnu-unique-object \
      --enable-install-libiberty \
      --enable-linker-build-id \
      --enable-lto \
      --enable-multilib \
      --enable-plugin \
      --enable-shared \
      --enable-threads='posix' \
      --disable-libssp \
      --disable-libstdcxx-pch \
      --disable-libunwind-exceptions \
      --disable-werror \
      --disable-libsanitizer \
      --enable-obsolete # needed for ia64
  make
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
  rm -r "$pkgdir/usr/share/"{locale,man/man7,info,"gcc-$pkgver"}

  ln -sf lib $pkgdir/usr/$_target/lib64
}


