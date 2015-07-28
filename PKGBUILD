# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=micmac
_pkgname=culture3d
pkgver=db2ea0c702c9
pkgrel=2
pkgdesc="Software for automatic matching in the geographical context"
arch=('i686' 'x86_64')
url='http://logiciels.ign.fr/?-Micmac,3-'
license=('CECILL-B')
depends=('qt4' 'imagemagick' 'exiv2' 'proj')
makedepends=('cmake' 'doxygen')
optdepends=('opencl-headers')
provides=("$pkgname")
options=('staticlibs')
source=("https://culture3d:culture3d@geoportail.forge.ign.fr/hg/culture3d/archive/${pkgver}.tar.gz")
md5sums=('fcf22a62a620922f62882fb2c3d81849')

build() {
  cd ${_pkgname}-${pkgver}  

  #Build
  if [[ -d ${srcdir}/build ]]; then
    (rm -rf ${srcdir}/build)
  fi

  mkdir ${srcdir}/build
  cd ${srcdir}/build 

  cmake -DCMAKE_INSTALL_PREFIX=/usr/local \
  -DBUILD_PATH_BIN=/usr/local/bin \
  -DBUILD_PATH_LIB=/usr/local/lib \
  -DWITH_DOXYGEN=ON \
  -DWITH_ETALONPOLY=ON \
  -DWITH_HEADER_PRECOMP=ON \
  -DWITH_INTERFACE=ON \
  -DWITH_OPENCL=OFF \
  -DWITH_OPEN_MP=OFF \
  -DWITH_QT4=ON \
  ../${_pkgname}-${pkgver} 

  make -j5
}

package() {
  cd ${srcdir}/build

  make DESTDIR="$pkgdir/" install || return 1 

  mkdir -p ${pkgdir}/usr/local/{binaire-aux,share/micmac}
  #install -Dm755 "${srcdir}/build/libANN.a"  "${pkgdir}/usr/local/lib/libANN.a"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/include" "${pkgdir}/usr/local"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/interface" "${pkgdir}/usr/local"
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/binaire-aux/ann_mec_filtre.LINUX" "${pkgdir}/usr/local/binaire-aux/ann_mec_filtre.LINUX"  
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/binaire-aux/exiftool" "${pkgdir}/usr/local/binaire-aux/exiftool"
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/binaire-aux/siftpp_tgi.LINUX" "${pkgdir}/usr/local/binaire-aux/siftpp_tgi.LINUX"  
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/data" "${pkgdir}/usr/local/share/micmac"
  #cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Documentation" "${pkgdir}/usr/local/share/micmac"
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/install Micmac/Licence_CeCILL_V2.1-fr.txt" "${pkgdir}/usr/local/share/micmac/Licence_CeCILL_V2.1-fr.txt"
  rm -rfv ${pkgdir}/home
}
