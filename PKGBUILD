# $Id$
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kfgz <kfgz@interia.pl>
# Mantainer: Lorenzo Ferrillo <lorenzofer at live dot it>

_basename=x265
pkgname=lib32-x265
pkgver=2.8
pkgrel=1
pkgdesc='Open Source H265/HEVC video encoder. 32bit libraries.'
arch=('x86_64')
url='https://bitbucket.org/multicoreware/x265'
license=('GPL')
depends=('gcc-libs-multilib'  'lib32-numactl')
makedepends=('cmake' 'nasm')
provides=('libx265.so')
source=("https://bitbucket.org/multicoreware/x265/downloads/x265_${pkgver}.tar.gz")
sha256sums=('6e59f9afc0c2b87a46f98e33b5159d56ffb3558a49d8e3d79cb7fdc6b7aaa863')

prepare() {
  cd x265_${pkgver}

  for d in 8 10 12; do
    if [[ -d build-$d ]]; then
      rm -rf build-$d
    fi
    mkdir build-$d
  done
}

build() {
  cd x265_${pkgver}/build-12
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  

#  cmake ../source \
 #   -DCMAKE_INSTALL_PREFIX='/usr'   -DCMAKE_LIBRARY_PATH='/usr/lib32'   \
  #  -DHIGH_BIT_DEPTH='TRUE' \
  #  -DMAIN12='TRUE' \
  #  -DEXPORT_C_API='TRUE' \
  #  -DENABLE_CLI='FALSE' \
 #   -DENABLE_SHARED='TRUE' 
 # make

  cd ../build-10

#  cmake ../source \
 #   -DCMAKE_INSTALL_PREFIX='/usr'   -DCMAKE_LIBRARY_PATH='/usr/lib32'   \
 #   -DHIGH_BIT_DEPTH='TRUE' \
 #   -DEXPORT_C_API='FALSE' \
  #  -DENABLE_CLI='FALSE' \
  #  -DENABLE_SHARED='FALSE'
 # make

  cd ../build-8

  #ln -s ../build-10/libx265.a libx265_main10.a
  #ln -s ../build-12/libx265.a libx265_main12.a

  cmake ../source \
    -DCMAKE_INSTALL_PREFIX='/usr'   -DCMAKE_LIBRARY_PATH='/usr/lib32'   \
    -DENABLE_SHARED='TRUE' \
    -DENABLE_HDR10_PLUS='TRUE' \
    -DEXTRA_LINK_FLAGS='-L .' 
  #  -DEXTRA_LIB='x265_main10.a;x265_main12.a' \
   # -DLINKED_10BIT='TRUE' \
   # -DLINKED_12BIT='TRUE'
  make
}

package() {
  cd x265_${pkgver}/build-8

  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/bin  "${pkgdir}"/usr/include -Rf
  mv "${pkgdir}"/usr/lib "${pkgdir}"/usr/lib32
}

