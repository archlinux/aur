_target=loongarch64-linux-gnu
pkgname=$_target-gcc-bootstrap
pkgver=12.2.1
_pkgdate=20220911
pkgrel=1
pkgdesc='Cross compiler for LoongArch 64-bit'
arch=('x86_64')
url='https://gcc.gnu.org/'
license=('GPL' 'LGPL' 'FDL')
groups=('loongarch')
makedepends=("$_target-binutils" "$_target-linux-api-headers")
options=('!emptydirs' '!strip')
provides=($_target-gcc)
conflicts=($_target-gcc)
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
      --disable-nls \
      --disable-libunwind-exceptions \
      --disable-libssp \
      --disable-multilib \
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
      --enable-checking=release

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

# vim: ts=2 sw=2 et:
