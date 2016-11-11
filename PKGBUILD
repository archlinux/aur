# $Id$
# Maintainer: Timo Sarawinski <t.sarawinski@gmail.com>

_target=arm-none-eabi
pkgname=$_target-newlib-linaro-git
_gitver=cf38811335370ab2bcd044801c56a2b081a0c5bf
pkgver=20160923
pkgrel=1
_libname=newlib
_upstream_ver=snapshot-"${pkgver}"
pkgdesc='A C standard library implementation intended for use on embedded systems (ARM bare metal) Linaro Git Version'
arch=(any)
url='http://www.sourceware.org/newlib/'
license=(BSD)
makedepends=($_target-gcc 'cloog-git')
options=(!emptydirs !strip)
provides=('"${_target}"-newlib')
source=("git+http://git.linaro.org/toolchain/newlib.git#tag=newlib-snapshot-${pkgver}")
sha1sums=('SKIP')

build() {

  cd "$srcdir/${_libname}"
  export CFLAGS_FOR_TARGET='-g -O3 -ffunction-sections -fdata-sections'
  ./configure \
    --target="$_target" \
    --prefix=/usr \
    --disable-newlib-supplied-syscalls \
    --disable-nls \
    --enable-newlib-io-long-long \
    --enable-newlib-register-fini \
    --enable-newlib-reent-small           \
    --disable-newlib-fvwrite-in-streamio  \
    --disable-newlib-fseek-optimization   \
    --disable-newlib-wide-orient          \
    --enable-newlib-nano-malloc           \
    --disable-newlib-unbuf-stream-opt     \
    --enable-lite-exit                    \
    --enable-newlib-global-atexit         \
    --enable-newlib-nano-formatted-io
  make
}

package() {
  cd "$srcdir/${_libname}/"
  make DESTDIR="${pkgdir}" install -j1
}
