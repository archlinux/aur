# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target=msp430-elf
pkgname=${_target}-binutils #-git
_pkgver=2.25.1
pkgver=${_pkgver}
#pkgver=2.25.r84308.c576455
pkgrel=2
pkgdesc="GNU binary utilities for the ${_target} target"
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
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2
        bfd-fix.patch)
sha256sums=('b5b14added7d78a8d1ca70b5cb75fef57ce2197264f4f5835326b0df22ac9f22'
            '1b5e879dbd9da83a8c7f86abac5cf706b8ba48e3f0525d893a53c651e4015124')

# pkgver() {
#   cd "${srcdir}/binutils-${_pkgver}"
#   printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" \
#     "$(git rev-parse --short HEAD)"
# 
# }

prepare() {
  cd "${srcdir}/binutils-${_pkgver}"
  # https://sourceware.org/bugzilla/show_bug.cgi?id=17940
  patch -p1 < ../bfd-fix.patch
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
