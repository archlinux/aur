# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target=msp430-elf
pkgname=${_target}-binutils #-git
_pkgver=2.26
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
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2
        dwarf-line-fix.patch)
sha256sums=('c2ace41809542f5237afc7e3b8f32bb92bc7bc53c6232a84463c423b0714ecd9'
            '465964bd2ebf5a7eea340c1e145b3e01bb9da4aa2d9e7d24f8d18a3d2473e2af')

# pkgver() {
#   cd "${srcdir}/binutils-${_pkgver}"
#   printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" \
#     "$(git rev-parse --short HEAD)"
# 
# }

prepare() {
  cd "${srcdir}/binutils-${_pkgver}"
  # fix for
  # https://sourceware.org/ml/binutils/2016-01/msg00299.html
  # found in
  # https://sourceware.org/ml/binutils/2016-01/msg00304.html
  patch -p1 < ../dwarf-line-fix.patch
 
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
