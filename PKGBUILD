# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=mips64-binutils-n64
pkgver=2.29
pkgrel=1
pkgdesc="binutils for N64 development"
arch=('x86_64' 'mips64')
url="https://ftp.gnu.org/gnu/binutils"
source=("binutils.tar.gz::https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.gz")
md5sums=('77a8b99de0481589a871062702df4e59')
options=('!buildflags' '!strip' 'staticlibs')
license=('GPL')

# Local variables
_prefix=/opt/n64-dev/usr/
_TARGET=mips64

prepare() {
  # -- Download in source directory.
  cd $srcdir

  # -- We configure binutils.
  mkdir {binutils,build-binutils}
  tar xf binutils.tar.gz --strip-components=1 -C binutils

  cd build-binutils
  ../binutils/configure --prefix=${_prefix}  \
                        --target=${_TARGET}  \
                        --disable-nls
}

build() {
  cd $srcdir/build-binutils/
  make -j4 all
}

package() {
  # -- We install binutils.
  cd $srcdir/build-binutils/
  make DESTDIR="${pkgdir}" install

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/${_prefix}/share/info
}
