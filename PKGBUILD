# Maintainer: Argyros Argyridis <arargyridis@gmail.com>
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=orfeo-toolbox
pkgver=5.0
minorver=0
pkgrel=2
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
source=(http://freefr.dl.sourceforge.net/project/orfeo-toolbox/OTB/OTB-$pkgver.$minorver/OTB-$pkgver.$minorver.tgz
		git://github.com/jmichel-otb/GKSVM.git)
noextract=()
md5sums=('414d838e59c0b762ec19023c5935a441' 'SKIP')
_gitname="GKSVM"

prepare() {
	## Module for monteverdi build
	cd 	$srcdir/  
	cp -ra $srcdir/GKSVM $srcdir/OTB-$pkgver.$minorver/Modules/Remote
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

  cmake ../OTB-$pkgver.$minorver \
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
	  -DITK_DIR=/usr/lib64/cmake/ITK-4.7 \
	  -DBUILD_SHARED_LIBS=ON \
	  -DOTB_USE_QT4=ON \
	  -DOTB_USE_MAPNIK=ON \
	  -DOTB_USE_OPENCV=ON \
	  -DOTB_USE_MUPARSER=ON \
	  -DOTB_USE_LIBKML=ON \
	  -DOTB_USE_LIBSVM=ON \
	  -DOTB_DATA_USE_LARGEINPUT=ON 
	  
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