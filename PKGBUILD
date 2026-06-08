# Maintainer : CoiledSpring
# Original maintainer: Julien Savard <juju@juju2143.ca>
# Based on msp430-elf-binutils

_target=sh3eb-elf
pkgname=${_target}-binutils
pkgver=2.46.0
pkgrel=1
pkgdesc="GNU binary utilities for the ${_target} target."
arch=(i686 x86_64)
options=('!libtool' '!emptydirs')
url='https://www.gnu.org/software/binutils/'
license=(GPL-2.0-or-later GPL-3.0-or-later LGPL-2.0-or-later LGPL-3.0-or-later GFDL-1.3-only GFDL-1.3 FSFAP)
depends=('zlib' 'zstd' 'binutils' 'jansson' 'libelf' 'glibc')
source=(https://ftpmirror.gnu.org/binutils/binutils-${pkgver}.tar.bz2)
sha256sums=('0f3152632a2a9ce066f20963e9bb40af7cf85b9b6c409ed892fd0676e84ecd12')

prepare() {
  cd "${srcdir}/binutils-${pkgver}"

  # ensure a clean build
  [[ -d binutils-build ]] && rm -rf binutils-build
  mkdir binutils-build
}

build() {
  cd "${srcdir}/binutils-${pkgver}/binutils-build"
  ../configure --target=${_target} \
    --prefix=/usr \
    --program-prefix=${_target}- \
    --disable-werror \
    --with-sysroot=/usr/${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --enable-cet \
    --enable-colored-disassembly \
    --enable-default-execstack=no \
    --enable-deterministic-archives \
    --enable-gold \
    --enable-jansson \
    --enable-ld=default \
    --enable-new-dtags \
    --enable-plugins \
    --enable-relro \
    --enable-shared \
    --enable-threads \
    --enable-gdb \
    --enable-gdbserver \
    --disable-libdecnumber \
    --disable-readline \
    --disable-sim \
    --disable-werror \
    --with-debuginfod \
    --with-pic \
    --with-system-zlib 



  make configure-host
  make
}

check() {
  cd "${srcdir}/binutils-${pkgver}/binutils-build"

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check
}

package() {
  cd "${srcdir}/binutils-${pkgver}/binutils-build"

  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}"/usr/bin/{ar,as,ld,nm,objdump,ranlib,strip,objcopy}
  rm -rf "${pkgdir}"/usr/lib
  rm -rf "${pkgdir}/usr/share/info"
  rm -rf "${pkgdir}/usr/share/locale"
  rm -rf "${pkgdir}/usr/include"
  # rm -rf "${pkgdir}/usr/share/gdb"
  # rm -rf "${pkgdir}/usr/include/gdb"
}
