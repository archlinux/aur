# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=mips64-gcc-stage1-n64
pkgver=7.2.0
pkgrel=1
arch=('x86_64' 'mips64')
pkgdesc="gcc-stage1 for the N64 toolchain."
url="https://ftp.gnu.org/gnu/gcc/"
source=("gcc.tar.gz::https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.gz")
makedepends=("mips64-binutils-n64")
depends=("n64-toolchain-git")
md5sums=('2e4be17c604ea555e0dff4a8f81ffe44')
options=('!buildflags' '!strip' 'staticlibs')

# Local variables
_prefix=/opt/n64-dev/usr/
_TARGET=mips64

prepare() {
  # -- We configure gcc.
  mkdir {gcc,build-gcc}
  tar xf gcc.tar.gz --strip-components=1 -C gcc

  # -- Download prerequesites.
  cd gcc; ./contrib/download_prerequisites; cd ../

  # -- Configure gcc.
  cd build-gcc
  ../gcc/configure  --prefix=${_prefix}                      \
                    --target=${_TARGET}                      \
                    --with-arch=vr4300                       \
                    --with-abi=32                            \
                    --with-sysroot=/opt/n64-dev/n64-sysroot/ \
                    --with-newlib                            \
                    --enable-langues=c,c++                   \
                    --enable-target-optspace                 \
                    --enable-sjlj-exceptions                 \
                    --disable-multilib                       \
                    --disable-threads                        \
                    --disable-nls
}

build() {
  # -- We build gcc executables.
  cd $srcdir/build-gcc/
  make -j4 all-gcc
}

package() {
  cd $srcdir/build-gcc/
  make DESTDIR="$pkgdir" install-gcc
}
