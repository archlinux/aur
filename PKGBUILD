# $Id$
# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

# NOTE: requires rebuilt with each new gcc version

_pkgname=libtool
pkgname=mingw-w64-${_pkgname}
pkgver=2.4.6
pkgrel=1
_gccver=6.3.1
pkgdesc="A generic library support script (mingw-w64)"
arch=('any')
url="http://www.gnu.org/software/libtool"
license=('GPL')
groups=('base-devel')
depends=('sh' 'tar' 'mingw-w64-crt')
makedepends=("mingw-w64-gcc=$_gccver")
options=('staticlibs' '!strip' '!buildflags')
provides=("mingw-w64-libltdl=$pkgver" "mingw-w64-libtool-multilib=$pkgver")
conflicts=('mingw-w64-libltdl' 'mingw-w64-libtool-multilib')
replaces=('mingw-w64-libltdl' 'mingw-w64-libtool-multilib')
source=(ftp://ftp.gnu.org/pub/gnu/libtool/${_pkgname}-${pkgver}.tar.xz{,.sig})
md5sums=('1bfb9b923f2c1339b4d2ce1807064aa5'
         'SKIP')
validpgpkeys=('CFE2BE707B538E8B26757D84151308092983D606')   # Gary Vaughan

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/${_pkgname}-${pkgver}/${_arch}
    cd ${srcdir}/${_pkgname}-${pkgver}/${_arch}
    ${_arch}-configure --prefix=/usr/${_arch} lt_cv_sys_lib_dlsearch_path_spec="/usr/${_arch}/lib"
    make
  done
}

#check() {
#  for _arch in ${_architectures}; do
#    cd ${srcdir}/${_pkgname}-${pkgver}/${_arch}
#    make check
#  done
#}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/${_pkgname}-${pkgver}/${_arch}
    make DESTDIR=${pkgdir} install
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
