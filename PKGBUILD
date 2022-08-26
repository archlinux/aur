# Maintainer: randomnobody <nobody "at" 420blaze "dot" it>
# Contributor: Finlay Maroney <finman292004@protonmail.com>

_target=i686-elf
pkgname=$_target-binutils
pkgver=2.39
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the i686-elf target'
arch=(i686 x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib libelf)
options=(!emptydirs !docs)
source=("https://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz"
        "https://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz.sig")
_basedir=binutils-$pkgver
sha256sums=('645c25f563b8adc0a81dbd6a41cffbf4d37083a382e02d5d3df4f65c09516d00'
            'SKIP')
validpgpkeys=("3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F")
prepare() {
  cd $_basedir

  mkdir $srcdir/binutils-build
}

build() {
  cd binutils-build

  $srcdir/$_basedir/configure \
    --target=$_target \
    --with-sysroot \
    --prefix=/usr \
    --bindir=/usr/bin \
    --libdir=/usr/lib/i686-elf/ \
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
