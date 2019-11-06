# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=micmac-git
_pkgname=micmac
pkgver=1.0.beta13.r602.g4667e6ee3
pkgrel=1
pkgdesc="Free open-source photogrammetry software tools - Version GIT"
arch=('i686' 'x86_64')
url='http://micmac.ensg.eu'
license=('CECILL-B')
depends=('imagemagick' 'exiv2' 'proj')
makedepends=('cmake' 'doxygen' 'git')
optdepends=('opencl-headers' 'qt5-base')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
options=('staticlibs')
source=("${_pkgname}::git+https://github.com/micmacIGN/micmac.git" 
		"fix_videovisage.patch")
md5sums=('SKIP'
         '4ea3f15b5425c9a98e9a252fc5166d98')


pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"

  [[ -d build ]] || mkdir build

  ## Fix build 
  cd "${_pkgname}"

  patch -Np0 -i ../fix_videovisage.patch
}

build() {
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr/local \
  -DBUILD_PATH_BIN=/usr/local/bin \
  -DBUILD_PATH_LIB=/usr/local/lib \
  -DWITH_CPP11=ON \
  -DWITH_INTERFACE=OFF  \
  -DWITH_DOXYGEN=ON \
  -DWITH_ETALONPOLY=ON \
  -DWITH_HEADER_PRECOMP=ON \
  -DWITH_QT5=OFF \
  -DWITH_OPENCL=OFF \
  -DWITH_OPEN_MP=OFF \
  ../${_pkgname}

  make -j4
}

package() {
  cd build

  make DESTDIR="$pkgdir/" install || return 1 

  mkdir -p ${pkgdir}/usr/local/share/micmac/scripts
  install -Dm755 "${srcdir}/build/CodeExterne/ANN/libANN.a"  "${pkgdir}/usr/local/lib/libANN.a"
  install -Dm755 "${srcdir}/build/CodeExterne/Poisson/libpoisson.a"  "${pkgdir}/usr/local/lib/libpoisson.a"
  install -Dm755 "${srcdir}/build/CodeExterne/Poisson/SurfaceTrimmer"  "${pkgdir}/usr/local/bin/SurfaceTrimmer"
  install -Dm755 "${srcdir}/build/CodeExterne/Poisson/PoissonRecon"  "${pkgdir}/usr/local/bin/PoissonRecon"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}/include" "${pkgdir}/usr/local/"
  ##cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}/interface" "${pkgdir}/usr/local"
  install -Dm755 "${srcdir}/${_pkgname}/binaire-aux/linux/ann_mec_filtre.LINUX" "${pkgdir}/usr/local/bin/ann_mec_filtre.LINUX"  
  install -Dm755 "${srcdir}/${_pkgname}/binaire-aux/linux/Conv_VSFM_MM" "${pkgdir}/usr/local/bin/Conv_VSFM_MM"  
  install -Dm755 "${srcdir}/${_pkgname}/binaire-aux/linux/siftpp_tgi.LINUX" "${pkgdir}/usr/local/bin/siftpp_tgi.LINUX"  
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}/data" "${pkgdir}/usr/local/share/micmac"
  cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}/scripts/noodles_exe_parallel.py" "${pkgdir}/usr/local/share/micmac/scripts/noodles_exe_parallel.py"
  ###cp -dr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/Documentation" "${pkgdir}/usr/local/share/micmac"
  #install -Dm755 "${srcdir}/${_pkgname}/install Micmac/Licence_CeCILL_V2.1-fr.txt" "${pkgdir}/usr/local/share/micmac/Licence_CeCILL_V2.1-fr.txt"
  rm -rfv ${pkgdir}/home  
}
