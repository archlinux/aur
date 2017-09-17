# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: garion < garion @ mailoo.org >

pkgname=mkvalidator
pkgver=0.5.2
pkgrel=1
pkgdesc="Validator for MKV files"
arch=('armv6h' 'i686' 'x86_64')
url='http://www.matroska.org/downloads/mkvalidator.html'
license=('BSD')
source=("http://sourceforge.net/projects/matroska/files/mkvalidator/mkvalidator-${pkgver}.tar.bz2")
sha1sums=('cd702e87568580d5db4184e64c19cd16eccb5263')
options=(!makeflags)

prepare() {
  cd "mkvalidator-${pkgver}"

  gcc ${CFAGS} -o coremake corec/tools/coremake/coremake.c

    if [ "${CARCH}" = "i686" ]; then
    _target="gcc_linux"
  elif [ "${CARCH}" = "x86_64" ]; then
    _target="gcc_linux_x64"
  elif [ "${CARCH}" = "armv6h" ]; then
    sed 's|arm-linux-gnueabi-||g' -i corec/tools/coremake/gcc_linux_arm
    _target="gcc_linux_arm"
  fi

  sed "s|/usr/local|${pkgdir}/usr|g" -i corec/tools/coremake/gcc_mak.inc

  ./coremake ${_target}
}

build(){
  cd "mkvalidator-${pkgver}/mkvalidator"
  make
}

package(){
  cd "mkvalidator-${pkgver}/mkvalidator"
  mkdir -p "${pkgdir}/usr/bin"
  make install
}
