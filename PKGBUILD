# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target=msp430-elf
pkgname=${_target}-binutils #-git
_pkgver=2.41
pkgver=${_pkgver}
pkgrel=1
pkgdesc="GNU binary utilities for the ${_target} target."
arch=(i686 x86_64)
options=('!libtool' '!buildflags') 
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=('zlib')
checkdepends=('dejagnu' 'bc')
source=(https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz)
sha256sums=('ae9a5789e23459e59606e6714723f2d3ffc31c03174191ef0d015bdf06007450')

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
    --enable-lto \
    --with-system-zlib \
    --enable-plugins

  make configure-host
  make
}

check() {
  cd "${srcdir}/binutils-${_pkgver}/binutils-build"
  
  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check || true
}

package() {
  cd "${srcdir}/binutils-${_pkgver}/binutils-build"

  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}"/usr/bin/{ar,as,ld,nm,objdump,ranlib,strip,objcopy}
  rm -f "${pkgdir}"/usr/lib/libiberty.a
  rm -rf "${pkgdir}/usr/share/info"
}

# vim:set ts=2 sw=2 et:
