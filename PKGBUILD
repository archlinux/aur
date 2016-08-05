# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target=msp430-elf
pkgname=${_target}-binutils #-git
_pkgver=2.27
pkgver=${_pkgver}
#pkgver=2.25.r84308.c576455
pkgrel=1
pkgdesc="GNU binary utilities for the ${_target} target."
arch=(i686 x86_64)
options=('!libtool' '!buildflags') 
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=('zlib' 'flex')

# build from trunk
# provides=("${_target}-binutils=${_pkgver}")
# conflicts=("${_target}-binutils")
# makedepends=('git')
# source=("binutils-${_pkgver}::git+git://sourceware.org/git/binutils-gdb.git")
# sha256sums=('SKIP')

# build from source
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
sha256sums=('369737ce51587f92466041a97ab7d2358c6d9e1b6490b3940eb09fb0a9a6ac88')

# pkgver() {
#   cd "${srcdir}/binutils-${_pkgver}"
#   printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" \
#     "$(git rev-parse --short HEAD)"
# 
# }

prepare() {
  cd "${srcdir}/binutils-${_pkgver}"

  # ensure a clean build
  [[ -d binutils-build ]] && rm -rf binutils-build
  mkdir binutils-build
}

build() {
  cd "${srcdir}/binutils-${_pkgver}/binutils-build"
  ../configure --target=${_target} \
    --prefix=/usr \
    --disable-nls \
    --program-prefix=${_target}- \
    --enable-multilib \
    --disable-werror \
    --with-sysroot=/usr/${_target} \
    --host=$CHOST \
    --build=$CHOST \
    --disable-shared \
    --enable-lto

  make configure-host
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
