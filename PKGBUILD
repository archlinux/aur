# Maintainer: Andras Biro <bbandi86@gmail.com>
# Contributor: Alex Forencich <alex at alexforencich dot com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>
_pkgnamenoplatform=binutils
_pkgnamenobrand=avr-${_pkgnamenoplatform}
pkgname=${_pkgnamenobrand}-atmel
pkgver=2.24
_atmelver=3.4.4
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for the AVR architecture"
url="http://www.atmel.com/tools/ATMELAVRTOOLCHAINFORLINUX.aspx"
arch=('x86_64' 'i686')
license=('GPL')
depends=('glibc>=2.17' 'zlib')
provides=('avr-binutils')
conflicts=('avr-binutils')
options=('staticlibs' '!distcc' '!ccache')
install=avr-binutils.install
source=("http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${_atmelver}/${_pkgnamenobrand}-${pkgver}.tar.bz2"
        "https://stormdragon.tk/patches/atmel-binutils-3.4.4-autotool.patch")
md5sums=('192f39ba0bd76096a09c57a6a0d4bdc5'
         '71e7b8a48b41db3be5d37cdcd6d24dfd')

_builddir=binutils-build
build() {
  
  cd ${srcdir}/${_pkgnamenoplatform}
  patch -p1 < ../atmel-binutils-3.4.4-autotool.patch
  
  # https://bugs.archlinux.org/task/34629
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
  
  rm -rf ${_builddir}
  mkdir ${_builddir} && cd ${_builddir}
  
  CFLAGS="-Os -g0 -s" ${srcdir}/${_pkgnamenoplatform}/configure\
                      --prefix=/usr\
                      --with-lib-path=/usr/lib:/usr/local/lib \
                      --disable-nls\
                      --enable-doc\
                      --target=avr\
                      --disable-werror\
                      --enable-install-libiberty\
                      --enable-instal-libbfd
    
    make configure-host
    
    make tooldir=/usr
}

package() {
  cd ${srcdir}/${_pkgnamenoplatform}/${_builddir}
  
  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install
  
  for bin in ar as nm objcopy objdump ranlib strip ; do
    rm -f ${pkgdir}/usr/bin/${bin}
  done
  
  for info in as bfd binutils configure gprof ld standards; do
    mv ${pkgdir}/usr/share/info/${info}.info ${pkgdir}/usr/share/info/avr-${info}.info
  done
  
  rm -rf ${pkgdir}/usr/share/locale
}

# vim:set ts=2 sw=2 et:
