# $Id$
# Maintainer: Timo Sarawinski <t.sarawinski@gmail.com>

_target=arm-none-eabi
pkgname=$_target-newlib-linaro-git
pkgver=3.0.0.18387.a9cfb33b6
_pkgver=20180831
pkgrel=1
_libname=newlib
_upstream_ver=snapshot-$pkgver
pkgdesc='A C standard library implementation intended for use on embedded systems (ARM bare metal) Linaro Git Version'
arch=(any)
url='http://www.sourceware.org/newlib/'
license=(BSD)
makedepends=($_target-gcc 'cloog-git')
options=(!emptydirs !strip)
provides=($_target-newlib)
source=("git+http://git.linaro.org/toolchain/newlib.git#tag=newlib-snapshot-$_pkgver")
sha1sums=('SKIP')


pkgver() {
  cd "$srcdir/${_libname}"
  printf "%s.%s.%s" \
    "$(git tag -l|grep -P '.+\..+\.\d+'|sed -r 's|v?([0-9\.]+)(-.+)?|\1|g'|sort -V -r|head -n1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)" |cut -d "-" -f2 
}

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
