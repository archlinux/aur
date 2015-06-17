# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_target=aarch64-linux-gnu
pkgname=$_target-eglibc
_pkgver=2.19
pkgver=2.19.r25988
pkgrel=1
pkgdesc="Embedded GNU C Library (${_target})"
arch=(any)
url='http://www.eglibc.org'
license=(GPL)
depends=($_target-linux-api-headers)
makedepends=($_target-gcc-stage2 subversion gperf)
provides=($_target-eglibc-headers=$pkgver)
conflicts=($_target-eglibc-headers)
replaces=($_target-eglibc-headers)
options=(!strip staticlibs)
source=(eglibc::svn://svn.eglibc.org/branches/eglibc-${_pkgver/./_}/libc)
md5sums=('SKIP')

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
  touch ../intl/plural.c

  export CFLAGS="-U_FORTIFY_SOURCE -mlittle-endian -O2"
  export CPPFLAGS="-U_FORTIFY_SOURCE -O2"
  unset LD_LIBRARY_PATH

  export BUILD_CC=gcc
  export CC=$_target-gcc
  export CXX=$_target-g++
  export AR=$_target-ar
  export RANLIB=$_target-ranlib

  ../configure \
    --target=$_target \
    --host=$_target \
    --prefix=/ \
    --with-headers=/usr/$_target/include \
    --enable-kernel=3.15 \
    --enable-add-ons=libidn,ports,nptl \
    --enable-shared \
    --with-tls \
    --with-__thread \
    --without-cvs \
    --disable-profile \
    --without-gd \
    --enable-obsolete-rpc

  make
}

package() {
  cd eglibc/build

  make "install_root=$pkgdir/usr/$_target" install

  mkdir -p "$pkgdir"/usr/$_target/usr
  ln -s ../{include,lib} "$pkgdir"/usr/$_target/usr
  # Remove unneeded for compilation files
  rm -rf "$pkgdir"/usr/$_target/{bin,sbin,etc,share,var}
}
