# Maintainer: Qian Yicheng <qsp2020@outlook.com>
_target=x86_64-pc-openbsd7
pkgname=$_target-gcc
pkgver=12.2.0
pkgrel=1
#_snapshot=8-20190111
pkgdesc='The GNU Compiler Collection - cross compiler for ARM64 target'
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils openbsdlib libmpc zlib libisl zstd)
makedepends=(gmp mpfr)
options=(!emptydirs !strip staticlibs !lto)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz)
        #https://gcc.gnu.org/pub/gcc/snapshots/$_snapshot/gcc-$_snapshot.tar.xz
sha256sums=('SKIP')
#validpgpkeys=(D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
#              33C235A34C46AA3FFB293709A328C3A2C3C45C06  # Jakub Jelinek <jakub@redhat.com>
#              13975A70E63C361C73AE69EF6EEB81F8981C74C7) # Richard Guenther <richard.guenther@gmail.com>

if [ -n "$_snapshot" ]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$pkgver
fi

prepare() {
  cd $_basedir

  echo $pkgver > gcc/BASE-VER

  # Do not run fixincludes
#  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  rm -rf "$srcdir"/gcc-build
  mkdir "$srcdir"/gcc-build
}

build() {
  cd gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
  # TODO: properly deal with the build issues resulting from this
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  "$srcdir"/$_basedir/configure \
      --without-headers \
      --with-gnu-as \
      --with-gnu-ld \
      --disable-nls \
      --enable-ld \
      --enable-libssp --enable-gold \
      --disable-libitm --disable-libquadmath \
      --disable-libgomp \
      --prefix=/usr \
      --program-prefix=$_target- \
      --with-local-prefix=/usr/$_target \
      --with-sysroot=/usr/$_target \
      --with-build-sysroot=/usr/$_target \
      --with-native-system-header-dir=/usr/include \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --target=$_target --host=$CHOST --build=$CHOST \
      --enable-languages=c,c++ \
      --enable-checking=release

  make -j$(nproc)
}

package() {
  cd gcc-build

  make DESTDIR="$pkgdir" install-gcc install-target-{libgcc,libstdc++-v3,libgomp,libquadmath,libatomic}

  # strip target binaries
  find "$pkgdir"/usr/lib/gcc/$_target/ "$pkgdir"/usr/$_target/lib \
       -type f -and \( -name \*.a -or -name \*.o \) \
       -exec $_target-objcopy -R .comment -R .note -R .debug_info -R .debug_aranges \
           -R .debug_pubnames -R .debug_pubtypes -R .debug_abbrev -R .debug_line \
           -R .debug_str -R .debug_ranges -R .debug_loc '{}' \;

  # strip host binaries
  find "$pkgdir"/usr/bin/ "$pkgdir"/usr/lib/gcc/$_target/ -type f -and \( -executable \) -exec strip '{}' \;
  rm -r "$pkgdir"/usr/$_target/lib/libgcc_s.so.1
  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm -r "$pkgdir"/usr/share/gcc-$pkgver
}
