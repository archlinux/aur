# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=orfeo-toolbox
pkgver=7.2.0
_pkgver=7.2
pkgrel=2
pkgdesc="ORFEO Toolbox (OTB) is an open source library of image processing algorithms"
arch=(x86_64 i686)
url="http://www.orfeo-toolbox.org/otb/"
license=('CeCILL')
groups=()
depends=('gdal' 'agg' 'freeglut' 'curl' 'fftw' 'tinyxml' 'muparser' 'fltk' 'python' 'openthreads' 'boost'
		'hdf5'  'itk4' 'ossim' 'libsvm' 'qwt' 'opencv>=3' 'glfw' 'openmpi' 'shark-ml-git')
makedepends=('git' 'swig' 'cmake' 'qt5-base')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("${pkgname}.tar.gz::https://www.orfeo-toolbox.org/packages/OTB-$pkgver.tar.gz"
		git://github.com/jmichel-otb/GKSVM.git)
noextract=()

md5sums=('39b254abcfe36769d1a2a58a7167b692'
         'SKIP')


_gitname="GKSVM"

prepare() {
	## Module for monteverdi build
	cd 	$srcdir/  
	cp -ra $srcdir/GKSVM $srcdir/Modules/Remote
}

build() {  
  cd $srcdir/  
 
  if  [ -d "$srcdir/build/" ]; then
    rm -rf $srcdir/build/
   fi
  mkdir $srcdir/build/
 
   cd $srcdir/build
 
   cmake ../ \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DOTB_USE_CURL=ON \
  -DBUILD_EXAMPLES=OFF \
  -DBUILD_TESTING=OFF \
  -DOTB_WRAP_PYTHON=ON \
  -DBUILD_SHARED_LIBS=ON \
  -DOTB_USE_QT=ON \
  -DOTB_USE_GLEW=ON \
  -DOTB_USE_OPENCV=ON \
  -DOTB_USE_MUPARSER=ON \
  -DOTB_USE_MPI=ON \
  -DOTB_USE_LIBKML=OFF \
  -DOTB_USE_LIBSVM=ON \
  -DOTB_USE_OPENMP=ON \
  -DOTB_USE_6S=ON \
  -DOTB_DATA_USE_LARGEINPUT=ON \
  -DOTB_USE_GLFW=ON \
  -DOTB_USE_OPENGL=ON \
  -DOTB_USE_SPTW=ON \
  -DOTB_USE_QWT=ON \
  -DOTB_USE_GLUT=ON \
  -DOTB_USE_SPTW=ON \
  -DOTB_USE_SHARK=ON \
  -DCMAKE_CXX_STANDARD=14
         
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
}
