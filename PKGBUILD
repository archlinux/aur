# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=mips64-newlib-n64
pkgver=2.5.0
pkgrel=1
pkgdesc="newlib for the N64 toolchain"
arch=('x86_64' 'mips64')
url="https://sourceware.org/pub/newlib"
source=("newlib.tar.gz::https://sourceware.org/pub/newlib/newlib-${pkgver}.tar.gz")
depends=("mips64-gcc-stage1-n64")
md5sums=('767dc60aaf814d091997d91d588968b2')
options=('!buildflags' '!strip')
license=('GPL')

# Local variables
_prefix=/opt/n64-dev/usr/
_TARGET=mips64

prepare() {

  # -- We configure newlib.
  mkdir {newlib,build-newlib}
  tar xf newlib.tar.gz --strip-components=1 -C newlib

  cd build-newlib
  ../newlib/configure --prefix=${_prefix}                      \
                      --target=mips64                          \
		                  --with-newlib                            \
                      --enable-target-optspace                 \
                      --enable-newlib-global-atexit            \
                      --disable-newlib-fvwrite-in-streamio     \
                      --disable-newlib-wide-orient             \
                      --enable-newlib-nano-malloc              \
                      --disable-newlib-unbuf-stream-opt        \
                      --disable-newlib-supplied-syscalls       \
                      --enable-lite-exit
}

build() {
  # -- We build newlib.
  export PATH=${_prefix}/bin:$PATH
  cd $srcdir/build-newlib
  make -j4 CC_FOR_TARGET=mips64-gcc all
}

package() {
  cd $srcdir/build-newlib
  make DESTDIR="${pkgdir}" install
}
