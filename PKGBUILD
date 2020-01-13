# Maintainer: Mateusz Kaczanowski <kaczanowski.mateusz@gmail.com>
# Adapted from arm-none-eabi- by Anatol Pomozov

_target=epiphany-elf
pkgname=$_target-gcc
pkgver=9.2
pkgrel=1
_snapshot=9-20200111
_newlibver=3.1.0
pkgdesc='The GNU Compiler Collection - cross compiler for the Adapteva Epiphany target'
arch=(i686 x86_64 armv7h)
url='http://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=($_target-binutils libmpc)
makedepends=(gmp mpfr)
#checkdepends=(dejagnu)
options=(!emptydirs !strip staticlibs)
source=(#ftp://gcc.gnu.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.bz2
        ftp://gcc.gnu.org/pub/gcc/snapshots/$_snapshot/gcc-$_snapshot.tar.xz
        ftp://sourceware.org/pub/newlib/newlib-$_newlibver.tar.gz)
sha256sums=('f3963e5f92b5f79cd8316dd8c6c334e3992bbda0ee545914bd7305c3137a29f5'
            'fb4fa1cc21e9060719208300a61420e4089d6de6ef59cf533b57fe74801d102a')

if [ -n "$_snapshot" ]; then
  _basedir=gcc-$_snapshot
else
  _basedir=gcc-$pkgver
fi

prepare() {
  cd "$srcdir/$_basedir"
  echo $pkgver > gcc/BASE-VER

  # Move newlib and libgloss to gcc source directory
  mv "$srcdir"/newlib-$_newlibver/newlib "$srcdir/$_basedir"
  mv "$srcdir"/newlib-$_newlibver/libgloss "$srcdir/$_basedir"

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" "$srcdir"/$_basedir/{libiberty,gcc}/configure
}

build() {
  cd $_basedir
  mkdir -p build
  cd build

  export CFLAGS_FOR_TARGET='-O2 -g -pipe'
  export CXXFLAGS_FOR_TARGET='-O2 -g -pipe'

  # disable-libcc1 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66955
  ../configure --target=$_target \
               --prefix=/usr \
               --libexecdir=/usr/lib \
               --with-pkgversion='Arch Repository' \
               --with-bugurl='https://bugs.archlinux.org/' \
               --enable-multilib \
               --enable-interwork \
               --enable-languages=c,c++ \
               --with-newlib \
               --with-gnu-as \
               --with-gnu-ld \
               --disable-nls \
               --disable-libcc1 \
               --with-headers=newlib/libc/include \
               --disable-werror

  make
}

check() {
  cd $_basedir/build
}

package() {
  cd $_basedir/build

  make DESTDIR="$pkgdir" install -j1

  # Strip host objects but do not touch target one (strip corrupts access.o in libepiphany.a)
  find "$pkgdir/usr/lib" -executable -type f -exec /usr/bin/strip --strip-debug '{}' \;
  find "$pkgdir/usr/bin" -executable -type f -exec /usr/bin/strip --strip-debug '{}' \;

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
  rm -r "$pkgdir"/usr/share/gcc-$pkgver
}
