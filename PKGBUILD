# Maintainer: Andras Biro <bbandi86@gmail.com>
# Contributor: Alex Forencich <alex at alexforencich dot com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>
_pkgnamenoplatform=gcc
_pkgnamenobrand=avr-${_pkgnamenoplatform}
pkgname=${_pkgnamenobrand}-atmel
pkgver=4.8.1
_atmelver=3.4.4
pkgrel=1
pkgdesc="The GNU AVR Compiler Collection"
url="http://www.atmel.com/tools/ATMELAVRTOOLCHAINFORLINUX.aspx"
arch=('x86_64' 'i686')
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('avr-binutils-atmel>=2.24' 'gcc-libs>=4.8.0' 'libmpc')
optdepends=('avr-libc: Standard C library for Atmel AVR development')
provides=("gcc-avr=$pkgver")
conflicts=('gcc-avr')
options=('staticlibs' '!emptydirs' '!strip')
source=("http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${_atmelver}/${_pkgnamenobrand}-${pkgver}.tar.bz2"
        "bugfix60486.patch")
md5sums=('e51124e20405c7598f9a01fb460f33e5'
         '01714fbab726728fae37d1ea866e1384')

_builddir=${_pkgnamenoplatform}-build
build() {
  # default CFLAGS lead to issues later on when configure 
  # calls avr-gcc with -march set.
  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"
  cd ${srcdir}/${_pkgnamenoplatform}
  patch -p0 < ../bugfix60486.patch

#   these were in the atmel script's but it didn't make any difference
#   pushd gcc/config/avr/
#   sh genopt.sh avr-mcus.def > avr-tables.opt
#   cat avr-mcus.def | awk -f genmultilib.awk FORMAT="Makefile" > t-multilib 
#   popd
#   #don't force old autoconf
#   sed -i 's/  \[m4_fatal(\[Please use exactly Autoconf \]/  \[m4_errprintn(\[Please use exactly Autoconf \]/g' ./config/override.m4 || task_error "sed failed"
#   autoconf
  
  # Do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in
  
  # https://bugs.archlinux.org/task/34629
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" gcc/configure
  
  cd ${srcdir}
  rm -rf ${_builddir}
  mkdir -p ${_builddir} && cd ${_builddir}
  
  CFLAGS="-Os -g0 -s" ${srcdir}/${_pkgnamenoplatform}/configure \
            --target=avr\
            --prefix=/usr\
            --libdir=/usr/lib\
            --libexecdir=/usr/lib\
            --infodir=/usr/share/info\
            --mandir=/usr/share/man\
            --enable-languages="c,c++"\
            --with-dwarf2\
            --enable-doc\
            --disable-libada\
            --disable-libssp\
            --disable-nls\
            --enable-shared \
            --disable-install-libiberty \
            --with-ld=/usr/bin/avr-ld\
            --with-as=/usr/bin/avr-as\
            --with-avrlibc=yes
  make all
}

package() {
  cd ${srcdir}/${_builddir}

  make -j1 DESTDIR=${pkgdir} install

  # Strip debug symbols from libraries; without this, the package size balloons to ~500MB.
  find ${pkgdir}/usr/lib -type f -name "*.a" \
      -exec /usr/bin/avr-strip --strip-debug '{}' \;
  
  cd ${pkgdir}/usr/bin/
  strip *
  cd ${pkgdir}/usr/lib/gcc/avr/${pkgver}/
  for binary in cc1 cc1plus collect2 lto-wrapper lto1 "install-tools/fixincl" "plugin/gengtype"
  do
    strip $binary
  done

  rm -rf ${pkgdir}/usr/share/man/man7
  rm -rf ${pkgdir}/usr/share/info

	install -Dm644 ${srcdir}/${_pkgnamenoplatform}/COPYING.RUNTIME ${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION
}

# vim:set ts=2 sw=2 et: