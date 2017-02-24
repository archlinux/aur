# Maintainer: Jonathan Kotta <jpkotta@gmail.com>
# Contributor: Andras Biro <bbandi86@gmail.com>
# Contributor: Alex Forencich <alex at alexforencich dot com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>

pkgname=avr-binutils-atmel
pkgver=2.26
_atmelver=3.5.4
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for the AVR architecture (from Atmel)"
url="http://www.atmel.com/tools/ATMELAVRTOOLCHAINFORLINUX.aspx"
arch=('x86_64' 'i686')
license=('GPL')
depends=('glibc>=2.17' 'zlib')
provides=('avr-binutils')
conflicts=('avr-binutils')
options=('staticlibs' '!distcc' '!ccache')
source=("http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${_atmelver}/avr-binutils.tar.bz2")
md5sums=('2929edd12f24c774f90cb109fc45630b')

_builddir=build

prepare() {
  cd ${srcdir}/binutils

  # https://bugs.archlinux.org/task/34629
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  rm -rf ${_builddir}
  mkdir ${_builddir}
}

build() {
  cd ${srcdir}/binutils

  config_guess=$(./config.guess)

  cd ${_builddir}

  # major difference with atmel's build script:
  #   --enable-install-libiberty
  #   --enable-install-libbfd
  CFLAGS="-Os -g0" ${srcdir}/binutils/configure \
        --prefix=/usr \
        --with-lib-path=/usr/lib:/usr/local/lib \
        --disable-nls \
        --enable-doc \
        --target=avr \
        --build=${config_guess} \
        --host=${config_guess} \
        --disable-werror \
        --disable-gdb \
        --disable-libdecnumber \
        --disable-readline \
        --disable-sim

  make configure-host

  make tooldir=/usr
}

package() {
  cd ${srcdir}/binutils/${_builddir}

  make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install

  for bin in ar as nm objcopy objdump ranlib strip readelf ; do
    rm -f ${pkgdir}/usr/bin/${bin}
  done

  for info in as bfd binutils gprof ld ; do
    mv ${pkgdir}/usr/share/info/${info}.info ${pkgdir}/usr/share/info/avr-${info}.info
  done

  rm -rf ${pkgdir}/usr/share/locale
}

# vim:set ts=2 sw=2 et:
