# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=orfeo-toolbox
pkgver=8.1.1
_pkgver=8.0
pkgrel=1
pkgdesc="ORFEO Toolbox (OTB) is an open source library of image processing algorithms"
arch=(x86_64 i686)
url="http://www.orfeo-toolbox.org/otb/"
license=('CeCILL')
groups=()
depends=('gdal' 'agg' 'freeglut' 'curl' 'fftw' 'tinyxml' 'muparser' 'fltk' 'python' 'openthreads' 'boost' 'ossim'
		'hdf5'  'insight-toolkit4' 'libsvm' 'qwt' 'opencv>=3' 'glfw' 'openmpi' 'shark-ml-git' 'glew')
makedepends=('git' 'swig' 'cmake' 'qt5-base')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("${pkgname}-${pkgver}.tar.gz::https://www.orfeo-toolbox.org/packages/OTB-$pkgver.tar.gz"
		"git+https://github.com/jmichel-otb/GKSVM.git")
noextract=()

md5sums=('e88956633cd67ea8276f8620e136c55e'
         'SKIP')


_gitname="GKSVM"

prepare() {
	## Module for monteverdi build
	echo $srcdir
	cd 	$srcdir/  
	cp -ra $srcdir/GKSVM $srcdir/Modules/Remote
	#commenting version detection for FindMUParser.cmake since it causes an error
	sed -i '62 s/^/#/' $srcdir/CMake/FindMuParser.cmake 
	sed -i '63 s/^/#/' $srcdir/CMake/FindMuParser.cmake 
	
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
  -DOTB_USE_GLUT=OFF \
  -DOTB_USE_SPTW=ON \
  -DOTB_USE_SHARK=OFF \
  -DITK_DIR=/opt/insight-toolkit4 \
  -DCMAKE_PREFIX_PATH=/opt/insight-toolkit4 \
  -DCMAKE_CXX_STANDARD=17 \
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
}
