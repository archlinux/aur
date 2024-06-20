# Maintainer: Finlay Maroney <finman292004@protonmail.com>

_target=i686-linux-gnu
pkgname=$_target-binutils
pkgver=2.33.1
pkgrel=2
pkgdesc='A set of programs to assemble and manipulate binary and object files for the i686-linux-gnu target'
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
options=(!emptydirs !docs)
source=("http://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz"
        "https://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz.sig"
        "libiberty-ignore-cflags.patch")
_basedir=binutils-$pkgver
sha256sums=('ab66fc2d1c3ec0359b8e08843c9f33b63e8707efdff5e4cc5c200eae24722cbf'
            'SKIP'
            '8b2aea00e98f7c311b1d0fb14e4b435a03c65fde32bc992c924edb6fa7b83c9c')
validpgpkeys=("3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F")
prepare() {
  cd $_basedir

  patch -p1 -i $srcdir/libiberty-ignore-cflags.patch

  mkdir $srcdir/binutils-build
}

build() {
  cd binutils-build

  $srcdir/$_basedir/configure \
    --target=$_target \
    --with-sysroot \
    --prefix=/usr \
    --bindir=/usr/bin \
    --disable-nls \
    --disable-werror

  make
}

check() {
  cd binutils-build
  
  # do not abort on errors - manually check log files
  make -k check
}

package() {
  cd binutils-build

  make DESTDIR="$pkgdir" install

  rm -r ${pkgdir}/usr/share/{info,man}
}

