# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=orfeo-toolbox
pkgver=5.10.0
_pkgver=5.10
minorver=1
pkgrel=1
pkgdesc="ORFEO Toolbox (OTB) is an open source library of image processing algorithms"
arch=(x86_64 i686)
url="http://www.orfeo-toolbox.org/otb/"
license=('CeCILL')
groups=()
depends=('cmake' 'gdal' 'agg' 'freeglut' 'curl' 'fftw' 'tinyxml' 'muparser' 'fltk' 'python2' 'openthreads' 
		'hdf5'  'insight-toolkit' 'libkml' 'ossim' 'libsvm' 'mapnik')
makedepends=('boost' 'swig')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=(https://www.orfeo-toolbox.org/packages/OTB-$pkgver.tar.gz
		git://github.com/jmichel-otb/GKSVM.git)
noextract=()

md5sums=('7004b52be82bb734beb435eeeece2397'
         'SKIP')


_gitname="GKSVM"

prepare() {
	## Module for monteverdi build
	cd 	$srcdir/  
	cp -ra $srcdir/GKSVM $srcdir/OTB-release-$_pkgver/Modules/Remote
}

build() {  
  cd $srcdir/  
  msg "Extracting archive..." 
  msg "starting make..."
  
  if  [ -d "$srcdir/build/" ]; then
    rm -rf $srcdir/build/
  fi
  mkdir $srcdir/build/

cd $srcdir/build

cmake ../OTB-release-$_pkgver \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_CXX_FLAGS="$CXXFLAGS -fPIC" \
-DCMAKE_C_FLAGS="$CFLAGS -fPIC" \
-DCMAKE_INSTALL_PREFIX=/usr \
-DOTB_USE_CURL=ON \
-DBUILD_EXAMPLES=OFF \
-DBUILD_TESTING=OFF \
-DOTB_WRAP_PYTHON=ON \
-DPYTHON_EXECUTABLE=/usr/bin/python2 \
-DPYTHON_LIBRARIES=/usr/lib/libpython2.7.so \
-DPYTHON_INCLUDE_PATH=/usr/include/python2.7/ \
-DOTB_INSTALL_PYTHON_DIR=/usr/lib/python2.7/site-packages/ \
-DITK_DIR=/usr/lib64/cmake/ITK-4.10 \
-DBUILD_SHARED_LIBS=ON \
-DOTB_USE_QT4=ON \
-DOTB_USE_MAPNIK=OFF \
-DOTB_USE_OPENCV=OFF \
-DOTB_USE_MUPARSER=ON \
-DOTB_USE_LIBKML=ON \
-DOTB_USE_LIBSVM=ON \
-DOTB_USE_OPENGL=ON \
-DOTB_USE_GLUT=ON \
-DOTB_DATA_USE_LARGEINPUT=ON \
-DOTB_BUILD_ALL_MODULES_FOR_TESTS=ON

make 

  
}

package() {
  # Install an ldconfig conf for Orfeo libs to be visible on the
  # system. Arch runs `ldconfig' after install automatically:
  echo "/usr/lib/otb  /usr/lib/otb/applications" > "${srcdir}/${pkgname}.conf"
  install -D -m644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
  
  cd "$srcdir/"build
  make DESTDIR="$pkgdir" install
}
