# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-gcc-base
pkgver=4.9.2
pkgrel=1
pkgdesc="Cross GCC for the MinGW-w64 cross-compiler (bootstrap)"
arch=('x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('mingw-w64-bootstrap' 'mingw-w64')
depends=('zlib' 'libmpc' 'ppl' 'cloog' 'mingw-w64-binutils' 'mingw-w64-headers' 'mingw-w64-headers-bootstrap')
conflicts=('mingw-w64-gcc')
options=('staticlibs' '!emptydirs')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2)
md5sums=('4df8ee253b7f3863ad0b86359cd39c43')

prepare() {
  cd ${srcdir}/gcc-${pkgver}

  #do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in
  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
}

build() {
  for _target in ${_targets}; do
    msg "Building ${_target} GCC C compiler"
    mkdir -p ${srcdir}/gcc-build-${_target} && cd ${srcdir}/gcc-build-${_target}

    ${srcdir}/gcc-${pkgver}/configure --prefix=/usr \
        --target=${_target} \
        --enable-languages=c,lto \
        --enable-shared --enable-static \
        --enable-threads=win32 \
        --with-system-zlib \
        --enable-lto --disable-dw2-exceptions --enable-libgomp \
        --disable-nls --enable-version-specific-runtime-libs \
        --disable-multilib --enable-checking=release
    make all-gcc
  done
}

package() {
  for _target in ${_targets}; do
    msg "Installing ${_target} GCC C compiler"
    cd ${srcdir}/gcc-build-${_target}
    make DESTDIR=${pkgdir} install-gcc
    strip ${pkgdir}/usr/bin/${_target}-*
    strip ${pkgdir}/usr/libexec/gcc/${_target}/${pkgver}/{cc1,collect2,lto*}
  done
  # remove unnecessary files
  msg "Removing man and info pages"
  rm -r ${pkgdir}/usr/share/man
  rm -r ${pkgdir}/usr/share/info
}
