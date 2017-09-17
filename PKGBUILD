# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: garion < garion @ mailoo.org >

pkgname=mkclean
pkgver=0.8.10
pkgrel=1
pkgdesc="Clean up and optimize MKV files"
arch=('armv6h' 'i686' 'x86_64')
url='http://www.matroska.org/downloads/mkclean.html'
license=('BSD')
source=("http://sourceforge.net/projects/matroska/files/mkclean/mkclean-${pkgver}.tar.bz2")
sha256sums=('96773e72903b00d73e68ba9d5f19744a91ed46d27acd511a10eb23533589777d')
options=('!makeflags')

prepare() {
  cd "mkclean-${pkgver}"

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
  cd "mkclean-${pkgver}/mkclean"
  make
}

package(){
  cd "mkclean-${pkgver}/mkclean"
  mkdir -p "${pkgdir}/usr/bin"
  make install
}
