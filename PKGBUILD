# Maintainer: Geronimo Bareiro <gero dot bare at gmail dot com>

_target="mips-harvard-os161"
pkgname=${_target}-gdb
_pkgver=7.8+os161-2.1
pkgver=${_pkgver/os161-/os161_}
pkgrel=4
pkgdesc="The GNU Debugger modified for ${_target} arquitecture. This is part of toolset for the course os161 from Harvard."
arch=(i686 x86_64)
url="http://os161.eecs.harvard.edu/"
license=('GPL' 'LGPL')
groups=('mips-harvard-os161-toolchain')
depends=('mips-harvard-os161-binutils>=2.24' 'gmp' 'mpfr' 'libmpc' 'guile2.0')
makedepends=('flex' 'bison')
options=(staticlibs !libtool !emptydirs !strip zipman docs)
source=(http://os161.eecs.harvard.edu/download/gdb-${_pkgver}.tar.gz
gdb.patch)
md5sums=('26295f3f67090e534e3d488a3edce5ae'
'SKIP')

prepare() {
  cd gdb-${_pkgver}

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  patch -p1 -i ${srcdir}/gdb.patch

  mkdir ${srcdir}/gdb-build
}

build() {
  cd gdb-build

  export CFLAGS="-O2"
  export CXXFLAGS="-O2"
  unset CPPFLAGS

  ../gdb-${_pkgver}/configure --prefix=/usr \
      --program-prefix=${_target}- \
      --with-local-prefix=/usr/lib/${_target} \
      --with-guile=guile-2.0 \
      --target=${_target} --host=${CHOST} --build=${CHOST} \
      --disable-nls --nfp \
      --disable-shared --disable-threads \
      --disable-werror

  make
}

package() {
  cd ${srcdir}/gdb-build

  make DESTDIR=${pkgdir} install

  # Delete the things we don't need
  rm -f ${pkgdir}/usr/lib/libiberty.a
  rm -rf ${pkgdir}/usr/share/info
  rm -rf ${pkgdir}/usr/share/gdb
  rm -rf ${pkgdir}/usr/include/gdb
  rm -rf ${pkgdir}/usr/share/man

}

# vim: set ts=2 sw=2 ft=sh et:
