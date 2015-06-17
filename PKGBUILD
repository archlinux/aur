# Maintainer: A. Weiss <adam [at] archlinux.us>
# Maintainer: Samuel Mesa <samuelmesa [at] linuxmail.org>

pkgname=osgearth
pkgver=2.5
pkgrel=2
pkgdesc="A terrain rendering toolkit for OpenSceneGraph"
arch=('i686' 'x86_64')
url=('http://www.osgearth.org')
license=('LGPL')
depends=('openscenegraph' 'gdal' 'expat' 'curl' 'minizip')
optdepends=('geos: Imrpoved vector support'
            'sqlite: Flat file cache'
            'libzip: Archive support' 'v8')
makedepends=('git' 'cmake')
provides=('osgearth')
conflicts=('osgearth-qt5')

_gitroot='git://github.com/gwaldron/osgearth.git'
_gitname='osgearth'
_gitbranch="osgearth-2.5"

build() {

  cd ${srcdir}

  msg "Connecting to ${_gitnam}e GIT server...."

  if [[ -d ${_gitname} ]] ; then
  	 cd ${_gitname} && git pull origin ${_gitbranch}
  	 msg "The local files are updated."
  else
	   git clone ${_gitroot} --branch ${_gitbranch}
  fi

  msg "GIT checkout done or server timeout"

  cd ${srcdir}
  
  if [ -d "build" ]; then
    rm -rf build
  fi
  
  mkdir build
  cd build

  msg "Starting make..."

  cmake ../${_gitname} \
  -DMINIZIP_INCLUDE_DIR=/usr/include/minizip \
  -DOSGEARTH_USE_QT:BOOL=OFF

  make -j10
  
}

package() {
   cd build
   make DESTDIR=${pkgdir} install
   mkdir -p ${pkgdir}/usr/local/share/osgearth
   cp -r $srcdir/${_gitname}/tests ${pkgdir}/usr/local/share/osgearth
   cp -r $srcdir/${_gitname}/data ${pkgdir}/usr/local/share/osgearth
   
   mkdir -p ${startdir}/pkg/${pkgname}/etc/ld.so.conf.d
  
   if [ "$CARCH" = "x86_64" ]; then
     echo /usr/local/lib64 > "${pkgdir}/etc/ld.so.conf.d/osgearth.conf"
   else
     echo /usr/local/lib > "${pkgdir}/etc/ld.so.conf.d/osgearth.conf"
   fi
}
