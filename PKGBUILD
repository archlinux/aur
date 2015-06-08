# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-eglibc-headers
pkgver=2.17
pkgrel=1
pkgdesc="Embedded GNU C Library. Stage 1 - headers only. Needed for initialy build toolchain (${_target})"
arch=(any)
url="http://www.eglibc.org"
license=('GPL')
depends=("${_target}-linux-api-headers")
makedepends=("${_target}-gcc-stage1" 'subversion')
options=(!strip)
source=(eglibc-${pkgver}::svn://svn.eglibc.org/branches/eglibc-${pkgver/./_}/libc)
md5sums=('SKIP')

build() {
  cd "$srcdir"
  cd eglibc-${pkgver}

  rm -rf build
  mkdir build
  cd build

  export CFLAGS="-U_FORTIFY_SOURCE -mlittle-endian -msoft-float -O2"
  unset LD_LIBRARY_PATH

  export BUILD_CC=gcc
  export CC=/usr/bin/${_target}-gcc
  export AR=/usr/bin/${_target}-ar
  export RANLIB=/usr/bin/${_target}-ranlib

  
  sed -r -i 's/(3..89..)/\1 | 4.*/' ../configure
  ../configure \
    --prefix=/ \
    --target=${_target} \
    --host=${_target} \
    --build=${CHOST} \
    --with-headers=/usr/${_target}/include \
    --enable-addons \
    --disable-profile \
    --without-gd \
    --without-cvs

  # make some libs and stubs
  make csu/subdir_lib
}

package() {
  cd "$srcdir/eglibc-$pkgver/build"

  make install-headers "install_root=${pkgdir}/usr/${_target}" \
    install-bootstrap-headers=yes

  mkdir -p "${pkgdir}/usr/${_target}/lib"
  cp csu/crt1.o csu/crti.o csu/crtn.o "${pkgdir}/usr/${_target}/lib"

  # create stub lib
  ${_target}-gcc -nostdlib -nostartfiles -shared -x c /dev/null \
    -o "${pkgdir}/usr/${_target}/lib/libc.so"

  mkdir -p "${pkgdir}/usr/${_target}/usr"
  ln -s ../{include,lib} "${pkgdir}/usr/${_target}/usr"
}
