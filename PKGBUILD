# Maintainer: Forest Crossman <cyrozap at gmail dot com>
# Contributor: Orlando Arias <orlandoarias at gmail <dot> com>

# Based on msp430-elf-binutils

_target=lm32-elf
pkgname=${_target}-binutils
_pkgver=2.32
pkgver=${_pkgver}
pkgrel=1
pkgdesc="GNU binary utilities for the ${_target} target."
arch=('i686' 'x86_64')
options=('!libtool' '!buildflags')
url='https://www.gnu.org/software/binutils/'
license=('GPL')
depends=('zlib' 'flex')
source=("https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2"{,.sig})
sha256sums=('de38b15c902eb2725eac6af21183a5f34ea4634cb0bcef19612b50e5ed31072d'
            'SKIP')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer)

prepare() {
  cd "${srcdir}/binutils-${_pkgver}"

  [[ -d binutils-build ]] && rm -rf binutils-build
  mkdir binutils-build
}

build() {
  cd "${srcdir}/binutils-${_pkgver}/binutils-build"
  ../configure --target=${_target} \
    --prefix=/usr \
    --disable-nls \
    --program-prefix=${_target}- \
    --host=$CHOST \
    --build=$CHOST

  make
}

check() {
  cd "${srcdir}/binutils-${_pkgver}/binutils-build"

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check
}

package() {
  cd "${srcdir}/binutils-${_pkgver}/binutils-build"

  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}"/usr/bin/{ar,as,ld,nm,objdump,ranlib,strip,objcopy}
  rm -f "${pkgdir}"/usr/lib/libiberty.a
  rm -rf "${pkgdir}/usr/share/info"
  # rm -rf "${pkgdir}/usr/share/gdb"
  # rm -rf "${pkgdir}/usr/include/gdb"
}

# vim:set ts=2 sw=2 et:
