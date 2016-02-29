# $Id$
# Maintainer Jens Staal <staal1978@gmail.com>
# Adopted from community package:
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-binutils-weak
provides=('mingw-w64-binutils')
conflicts=('mingw-w64-binutils')
replaces=('mingw-w64-binutils')
pkgver=2.26.r86590.63aef21
pkgrel=1
pkgdesc="Cross binutils for the MinGW-w64 cross-compiler - patched for weak NT externals"
#this is a temporary package until those patches are applied upstream
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils"
license=('GPL')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=('zlib')
makedepends=('git')
options=('!libtool' '!emptydirs')
source=('git://sourceware.org/git/binutils-gdb.git'
	"coff-linker-weak-nt-externals.patch"
	"gas-aux-nt-weak-externals.patch"
	"objcopy-weak-nt-externals2local.patch")
md5sums=('SKIP'
         'd861dd1ecfc4049bf46b53a565dc6b89'
         'e4a89dbe759293d62ca0206223340d24'
         '4bdea67da7b9c8e0d8ca1dd5f94dcef6')
         
pkgver() {
   cd ${srcdir}/binutils-gdb
   echo $(cat binutils/configure | grep "PACKAGE_VERSION=" | sed "s|^PACKAGE_VERSION='||" | sed "s|'$||" | sed "s|\.51$||").r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd ${srcdir}/binutils-gdb

  #do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

    msg "patch for NT weak externals"
    git apply $srcdir/coff-linker-weak-nt-externals.patch
    git apply $srcdir/gas-aux-nt-weak-externals.patch
    git apply $srcdir/objcopy-weak-nt-externals2local.patch

}

build() {
  cd ${srcdir}/binutils-gdb
  for _target in $_targets; do
    msg "Building ${_target} cross binutils"
    mkdir -p ${srcdir}/binutils-${_target} && cd "${srcdir}/binutils-${_target}"
    $srcdir/binutils-gdb/configure --prefix=/usr \
        --target=${_target} \
        --infodir=/usr/share/info/${_target} \
        --enable-lto --enable-plugins \
        --disable-multilib --disable-nls \
        --disable-werror
     make
  done
}

package() {
  for _target in ${_targets}; do
    msg "Installing ${_target} cross binutils"
    cd ${srcdir}/binutils-${_target}
    make DESTDIR=${pkgdir} install
    #remove conflicting files
    rm -rf ${pkgdir}/usr/include/gdb
    rm -rf ${pkgdir}/usr/share/gdb
  done
}
