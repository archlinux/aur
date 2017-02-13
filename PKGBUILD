# Maintainer: Geronimo Bareiro <gero dot bare at gmail dot com>

_target="mips-harvard-os161"
pkgname=${_target}-binutils
_pkgver=2.24+os161-2.1
pkgver=${_pkgver/os161-/os161_}
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for ${_target} arquitecture. This is part of toolset for the course os161 from Harvard."
arch=('i686' 'x86_64')
url="http://os161.eecs.harvard.edu/"
license=('GPL')
groups=('mips-harvard-os161-toolchain')
depends=('glibc>=2.24' 'zlib')
options=('staticlibs' '!distcc' '!ccache')
source=(http://os161.eecs.harvard.edu/download/binutils-${_pkgver}.tar.gz)
md5sums=('89fb5251c8fac189551f30550e6c4d0b')

prepare() {
  cd binutils-${_pkgver}

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  mkdir ${srcdir}/binutils-build
}

build() {
  cd binutils-build

  ../binutils-${_pkgver}/configure --prefix=/usr \
      --program-prefix=${_target}- \
      --with-lib-path=/usr/lib/binutils/${_target} \
      --with-local-prefix=/usr/lib/${_target} \
      --with-sysroot=/usr/${_target} \
      --target=${_target} --host=${CHOST} --build=${CHOST} \
      --disable-nls --nfp \
      --disable-shared --disable-threads \
      --disable-werror

  make configure-host

  make tooldir=/usr
}

check() {
  cd binutils-build
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # ignore failures in gold testsuite...
  make -k LDFLAGS="" check || true
}

package() {
  cd binutils-build
  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install

  # Remove unwanted files
  rm -rf ${pkgdir}/usr/share
  rm -f ${pkgdir}/usr/bin/{ar,as,ld,nm,objdump,ranlib,readelf,strip,objcopy}
}

