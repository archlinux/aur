# Maintainer: Jannik Birk <birk.jannik@gmail.com>

_target=i686-elf
pkgname=$_target-binutils
pkgver=2.29
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the i686-elf target'
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
source=("http://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz"
        "libiberty-ignore-cflags.patch")
sha256sums=('0b871e271c4c620444f8264f72143b4d224aa305306d85dd77ab8dce785b1e85'
            '8b2aea00e98f7c311b1d0fb14e4b435a03c65fde32bc992c924edb6fa7b83c9c')
_basedir=binutils-$pkgver

prepare() {
  cd $_basedir

  patch -p1 -i $srcdir/libiberty-ignore-cflags.patch

  mkdir $srcdir/binutils-build
}

build() {
  cd binutils-build

  $srcdir/$_basedir/configure \
    --target=$_target \
    --with-sysroot=/usr/$_target \
    --prefix=/usr \
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

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,nlmconv,windres,windmc}*

  # Remove info documents that conflict with host version
  rm -rf "$pkgdir"/usr/share/info
}
