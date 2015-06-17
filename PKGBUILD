# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_target=aarch64-linux-gnu
pkgname=$_target-eglibc-headers
_pkgver=2.19
pkgver=2.19.r25988
pkgrel=1
pkgdesc="Embedded GNU C Library. Stage 1 - headers only. Needed for initialy build toolchain ($_target)"
arch=(any)
url='http://www.eglibc.org'
license=(GPL)
depends=($_target-linux-api-headers)
makedepends=($_target-gcc-stage1 subversion)
options=(!strip)
source=(eglibc::svn://svn.eglibc.org/branches/eglibc-${_pkgver/./_}/libc)
sha1sums=('SKIP')

pkgver() {
  cd eglibc
  local ver="$(svnversion)"
  printf "$_pkgver.r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd eglibc

  # Don not build timezones
  sed -i 's/timezone rt/rt/' Makeconfig

  rm -rf build
  mkdir build
  cd build

  export CFLAGS="-U_FORTIFY_SOURCE  -mlittle-endian -O2"
  unset LD_LIBRARY_PATH

  export BUILD_CC=gcc
  export CC=$_target-gcc
  export AR=$_target-ar
  export RANLIB=$_target-ranlib

  ../configure \
    --target=$_target \
    --host=$_target \
    --prefix=/  \
    --with-headers=/usr/$_target/include \
    --enable-add-ons=libidn,ports,nptl \
    --disable-profile \
    --without-gd \
    --without-cvs

  # make some libs and stubs
  make csu/subdir_lib
}

package() {
  cd eglibc/build

  make install-headers "install_root=$pkgdir/usr/$_target" \
    install-bootstrap-headers=yes

  mkdir -p "$pkgdir/usr/$_target/lib"
  cp csu/crt1.o csu/crti.o csu/crtn.o "$pkgdir/usr/$_target/lib"

  # create stub lib
  $_target-gcc -nostdlib -nostartfiles -shared -x c /dev/null \
    -o "$pkgdir/usr/$_target/lib/libc.so"

  mkdir -p "$pkgdir/usr/$_target/usr"
  ln -s ../{include,lib} "$pkgdir/usr/$_target/usr"
}
