# Maintainer: Rafael Silva (perigoso) <perigoso@riseup.net>

_target=ft32-elf
pkgname=$_target-gcc
pkgver=8.5.0
_islver=0.24
pkgrel=2
pkgdesc='The GNU Compiler Collection - cross compiler for Bridgetek FT9xx (bare-metal) target'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils zlib libmpc)
makedepends=(gmp mpfr $_target-newlib)
optdepends=("$_target-newlib: Standard C library optimized for embedded systems")
options=(!emptydirs !strip)
source=("https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"{,.sig}
        "https://libisl.sourceforge.io/isl-$_islver.tar.xz")
sha512sums=('92f599680e6b7fbce88bcdda810f468777d541e5fddfbb287f7977d51093de2a5178bd0e6a08dfe37090ea10a0508a43ccd00220041abbbec33f1179bfc174d8'
            'SKIP'
            'ff6bdcff839e1cd473f2a0c1e4dd4a3612ec6fee4544ccbc62b530a7248db2cf93b4b99bf493a86ddf2aba00e768927265d5d411f92061ea85fd7929073428e8')
validpgpkeys=('13975A70E63C361C73AE69EF6EEB81F8981C74C7'  # Richard Guenther <richard.guenther@gmail.com>
              'D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62') # Jakub Jelinek <jakub@redhat.com>

_basedir=gcc-$pkgver

prepare() {
  cd $_basedir

  # link isl for in-tree builds
  ln -sf ../isl-$_islver isl

  echo $pkgver > gcc/BASE-VER

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" "$srcdir"/$_basedir/{libiberty,gcc}/configure

  rm -rf "$srcdir"/gcc-build
  mkdir -p "$srcdir"/gcc-build
}

build() {
  cd gcc-build

  export CFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'
  export CXXFLAGS_FOR_TARGET='-g -Os -ffunction-sections -fdata-sections'

  "$srcdir"/$_basedir/configure \
      --target=$_target \
      --prefix=/usr \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --program-prefix=$_target- \
      --with-local-prefix=/usr/$_target \
      --with-build-sysroot=/usr/$_target \
      --with-sysroot=/usr/$_target \
      --with-newlib \
      --without-headers \
      --disable-shared \
      --disable-threads \
      --with-system-zlib \
      --enable-tls \
      --enable-languages=c \
      --disable-libatomic \
      --disable-libmudflap \
      --disable-libssp \
      --disable-libquadmath \
      --disable-libgomp \
      --disable-nls \
      --enable-multilib \
      --disable-bootstrap \
      --enable-checking=release

  make inhibit-libc=true
}

package() {
  cd gcc-build

  make DESTDIR="$pkgdir" inhibit-libc=true install

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/ \
       -type f -and \( -name \*.a -or -name \*.o \) \
       -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges \
       -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
       -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/ -type f -and \( -executable \) -exec strip '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm "$pkgdir"/usr/lib/libcc1.*
}
