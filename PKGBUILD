# Maintainer: Nicolas Farmer <nicolas dot farmer at proton dot me>

_target=ia64-linux-gnu
pkgname=$_target-gcc-bootstrap
pkgver=14.1.0
pkgrel=1
pkgdesc='The GNU Compiler Collection. Bootstrap for toolchain building (ia64)'
arch=('any')
makedepends=("$_target-binutils" "$_target-linux-api-headers")
options=('!emptydirs' '!strip')
provides=($_target-gcc)
conflicts=($_target-gcc)
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

  "$srcdir/gcc-$pkgver/configure" \
      --prefix=/usr \
      --program-prefix=$_target- \
      --with-local-prefix=/usr/$_target \
      --with-sysroot=/usr/$_target \
      --with-build-sysroot=/usr/$_target \
      --with-native-system-header-dir='/include' \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --target=$_target \
      --host=$CHOST \
      --build=$CHOST \
      --with-system-zlib \
      --disable-nls \
      --disable-libunwind-exceptions \
      --disable-libssp \
      --disable-werror \
      --enable-languages=c \
      --disable-shared \
      --enable-linker-build-id \
      --with-gnu-as \
      --with-gnu-ld \
      --with-newlib \
      --without-headers \
      --without-included-gettext \
      --enable-lto \
      --disable-multilib \
      --enable-plugin \
      --disable-decimal-float \
      --disable-gold \
      --disable-libatomic \
      --disable-libgcj \
      --disable-libvtv \
      --disable-threads \
      --enable-tls \
      --disable-libgomp \
      --disable-libquadmath \
      --enable-checking=release \
      --enable-obsolete # needed for ia64

  make -j`nproc`
}

package() {
  make -C gcc-build DESTDIR="$pkgdir" \
    install-gcc install-target-{libgcc,libstdc++-v3,libgomp,libgfortran,libquadmath,libatomic}
#install-gcc install-target-libgcc install-target-libstdc++-v3

  # Strip target binaries
  find "$pkgdir/usr/lib/gcc/$_target/" -type f \
    -and \( -name \*.a -or -name \*.o \) -exec $_target-objcopy \
    -R .comment -R .note -R .debug_info -R .debug_aranges -R .debug_pubnames \
    -R .debug_pubtypes -R .debug_abbrev -R .debug_line -R .debug_str \
    -R .debug_ranges -R .debug_loc '{}' \;

  # Strip host binaries
  find "$pkgdir/usr/bin/" "$pkgdir/usr/lib/gcc/$_target/" -type f \
    -and \( -executable \) -exec strip '{}' \; || true

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir/usr/share/"{man,info}
}
