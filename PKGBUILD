# Maintainer: Jonathan Kotta <jpkotta@gmail.com>
# Contributor: Andras Biro <bbandi86@gmail.com>
# Contributor: Alex Forencich <alex at alexforencich dot com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: danst0 <danst0@west.de>

pkgname=avr-gcc-atmel
pkgver=4.9.2
_atmelver=3.5.4
pkgrel=1
pkgdesc="The GNU AVR Compiler Collection (from Atmel)"
url="http://www.atmel.com/tools/ATMELAVRTOOLCHAINFORLINUX.aspx"
arch=('x86_64' 'i686')
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('avr-binutils' 'gcc-libs' 'libmpc')
optdepends=('avr-libc: Standard C library for Atmel AVR development')
provides=("avr-gcc=$pkgver")
conflicts=('avr-gcc')
options=('staticlibs' '!emptydirs' '!strip')
source=("http://distribute.atmel.no/tools/opensource/Atmel-AVR-GNU-Toolchain/${_atmelver}/avr-gcc.tar.bz2"
        "gperf-inlines.patch")
md5sums=('a10ce1c02bc9e990f3c88252f3b7bb25'
         '81bd4c68c80c796d3e2acbe4ca9bec56')

_builddir=build

prepare() {
  cd ${srcdir}/gcc

  # https://bugs.archlinux.org/task/34629
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure gcc/configure

  patch -p0 < ${srcdir}/gperf-inlines.patch

  rm -rf ${_builddir}
  mkdir -p ${_builddir}
}

build() {
  cd ${srcdir}/gcc

  # default CFLAGS lead to issues later on when configure
  # calls avr-gcc with -march set.
  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  config_guess=$(./config.guess)

  cd ${_builddir}

  # major differences from avr build script:
  #   --disable-shared
  CFLAGS="-Os -g0 -s" ${srcdir}/gcc/configure \
        --target=avr \
        --host=${config_guess} \
        --build=${config_guess} \
        --prefix=/usr \
        --enable-languages="c,c++" \
        --with-dwarf2 \
        --enable-doc \
        --enable-shared \
        --disable-libada \
        --disable-libssp \
        --disable-nls \
        --with-ld=/usr/bin/avr-ld \
        --with-as=/usr/bin/avr-as \
        --disable-install-libiberty \
        --with-avrlibc=yes

  make all
}

package() {
  cd ${srcdir}/gcc/${_builddir}

  make -j1 DESTDIR=${pkgdir} install

  # Strip debug symbols from libraries; without this, the package size
  # balloons to ~500MB.
  find ${pkgdir}/usr/lib -type f -name "*.a" \
       -exec /usr/bin/avr-strip --strip-debug '{}' \;

  (cd ${pkgdir}/usr/bin/ ; strip *)

  (cd ${pkgdir}/usr/libexec/gcc/avr/${pkgver}/ ;
   for binary in cc1 cc1plus collect2 lto-wrapper lto1 \
                     install-tools/fixincl plugin/gengtype ; do
     strip $binary
   done
  )

  rm -rf ${pkgdir}/usr/share/man/man7

  (cd ${pkgdir}/usr/share/info/ ;
   for i in *.info ; do
     mv "$i" "avr-$i"
   done
  )

  install -Dm644 ${srcdir}/gcc/COPYING.RUNTIME \
          ${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION
}

# vim:set ts=2 sw=2 et:
