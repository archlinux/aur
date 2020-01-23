# Maintainer: Finlay Maroney <finman292004@protonmail.com>

_target=i686-elf
pkgname=$_target-gcc
pkgver=9.2.0
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for i686-elf target'
arch=(i686 x86_64)
url='http://gcc.gnu.org/'
license=(GPL LGPL)
depends=($_target-binutils zlib libmpc mpfr gmp)
options=(!emptydirs)
source=("https://mirrors.kernel.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"
        "libiberty-ignore-cflags.patch"
        "https://mirrors.kernel.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz.sig")
sha256sums=('ea6ef08f121239da5695f76c9b33637a118dcf63e24164422231917fa61fb206'
            '8b2aea00e98f7c311b1d0fb14e4b435a03c65fde32bc992c924edb6fa7b83c9c'
            'SKIP')
_basedir=gcc-$pkgver
validpgpkeys=("33C235A34C46AA3FFB293709A328C3A2C3C45C06")
prepare() {
  cd $_basedir
 
  patch -p1 -i $srcdir/libiberty-ignore-cflags.patch

  mkdir $srcdir/gcc-build
}

build() {
  cd gcc-build

  $srcdir/$_basedir/configure \
    --target=$_target \
    --prefix=/usr \
    --disable-nls \
    --disable-plugin \
    --enable-languages=c,c++ \
    --without-headers

  make all-gcc
  make all-target-libgcc
}

check() {
  cd gcc-build

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || true
  $srcdir/$_basedir/contrib/test_summary
}

package() {
  cd gcc-build

  make DESTDIR="$pkgdir" install-gcc
  make DESTDIR="$pkgdir" install-target-libgcc

  # Remove files that conflict with host gcc package
  rm -r "$pkgdir"/usr/share/man/man7
  rm -r "$pkgdir"/usr/share/info
}

