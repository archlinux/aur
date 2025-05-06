# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>
# Contributor: Tu Yu-Hsuan <dobe0331@gmail.com>

pkgname=orfeo-toolbox
pkgver=9.1.1
_pkgver=9.1
pkgrel=2
pkgdesc="ORFEO Toolbox (OTB) is an open source library of image processing algorithms"
arch=(x86_64 i686)
url="http://www.orfeo-toolbox.org"
license=('CeCILL')
groups=()
depends=('gdal' 'cblas' 'freeglut' 'curl' 'fftw' 'tinyxml' 'muparser' 'muparserx' 'python' 'boost' 'lapack' 'hdf5' 'insight-toolkit4' 'libsvm' 'opencv>=3' 'openmpi' 'libkml')
makedepends=('git' 'swig' 'cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("${pkgname}-${pkgver}.tar.gz::https://www.orfeo-toolbox.org/packages/OTB-$pkgver.tar.gz"
"package.patch"
"git+https://github.com/jmichel-otb/GKSVM.git"
)
noextract=()

md5sums=('0d5a054a59e0b17e0e7539a3f6130f9d'
         '28eca0a5a7d488745b62c23ea3a3f0bf'
         'SKIP')


_gitname="GKSVM"

prepare() {
	cd 	$srcdir/  
	cp -ra $srcdir/GKSVM $srcdir/Modules/Remote
    patch -Np1 -i ../package.patch
	
}



build() {
  echo $pkgdir
  cd $srcdir/
 
  if  [ -d "$srcdir/build/" ]; then
   rm -rf $srcdir/build/
  fi
  mkdir $srcdir/build/
 
  cd $srcdir/build
 
  cmake ../ \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_EXAMPLES=OFF \
  -DBUILD_TESTING=OFF \
  -DOTB_USE_CURL=ON \
  -DOTB_WRAP_PYTHON=OFF \
  -DBUILD_SHARED_LIBS=ON \
  -DOTBGroup_FeaturesExtraction=ON \
  -DOTBGroup_Hyperspectral=ON \
  -DOTBGroup_Learning=OFF \
  -DOTBGroup_Miscellaneous=ON \
  -DOTBGroup_Remote=ON \
  -DOTBGroup_SAR=ON \
  -DOTBGroup_Segmentation=ON \
  -DOTBGroup_StereoProcessing=ON \
  -DOTB_USE_OPENCV=ON \
  -DOTB_USE_MUPARSER=ON \
  -DOTB_USE_MUPARSERX=OFF \
  -DOTB_USE_LIBKML=ON \
  -DOTB_USE_LIBSVM=ON \
  -DOTB_USE_OPENMP=ON \
  -DOTB_USE_6S=OFF \
  -DOTB_DATA_USE_LARGEINPUT=ON \
  -DOTB_USE_SPTW=ON \
  -DOTB_USE_SPTW=ON \
  -DOTB_USE_SHARK=OFF \
  -DITK_DIR=/opt/insight-toolkit4 \
  -DCMAKE_PREFIX_PATH=/opt/insight-toolkit4 \
  -DCMAKE_CXX_STANDARD=17 \
  -DCMAKE_CXX_FLAGS:STRING="-march=native" \
  -DBoost_USE_STATIC_LIBS=OFF
         
  make


 
}
 
package() {
  # Install an ldconfig conf for Orfeo libs to be visible on the
  # system. Arch runs `ldconfig' after install automatically:
  echo "/usr/lib/otb
  /usr/lib/otb/applications" > "${srcdir}/${pkgname}.conf"
  install -D -m644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
 
  cd "$srcdir/"build
  make DESTDIR="$pkgdir" install
  #mkdir ${pkgdir}/usr/bin/tools/
  #install -D -m644 "$srcdir/build/post_install.sh" "${pkgdir}/usr/bin/tools/"
  export OTB_INSTALL_DIR=$pkgdir/usr
  export CMAKE_DIRS=$pkgdir/usr/lib/cmake
  #sh $srcdir/build/post_install.sh

}
