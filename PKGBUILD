# Maintainer: Orlando Arias <orlandoarias at gmail <dot> com>

_target=msp430-elf
pkgname=${_target}-binutils #-git
_pkgver=2.26.1
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
        dwarf-line-fix.patch
        msp430-dis.c.patch
        update-mcu-list.patch)
sha256sums=('39c346c87aa4fb14b2f786560aec1d29411b6ec34dce3fe7309fe3dd56949fd8'
            '465964bd2ebf5a7eea340c1e145b3e01bb9da4aa2d9e7d24f8d18a3d2473e2af'
            '0c389f2912d5c860da4f3fd01e589d6da1875582dbca38fde50ae8cd90ab7c79'
            'cb0eeaa1c4d90c1da5a26827a2c7f379c8572b7f1373f0f5146e6823b53d5ced')

# pkgver() {
#   cd "${srcdir}/binutils-${_pkgver}"
#   printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" \
#     "$(git rev-parse --short HEAD)"
# 
# }

prepare() {
  cd "${srcdir}/binutils-${_pkgver}"
  # the following fixes are scheduled for the 2.27 release
  # fix for
  # https://sourceware.org/ml/binutils/2016-01/msg00299.html
  # found in
  # https://sourceware.org/ml/binutils/2016-01/msg00304.html
  patch -p1 < ../dwarf-line-fix.patch
  # fix for
  # https://sourceware.org/bugzilla/show_bug.cgi?id=20150
  patch -p1 < ../msp430-dis.c.patch
  # updated mcu list
  # https://sourceware.org/ml/binutils/2016-02/msg00243.html
  patch -p1 < ../update-mcu-list.patch

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
