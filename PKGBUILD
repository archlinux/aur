# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname='libmini-svn'
_pkgname=libmini
pkgver=0
pkgrel=2
pkgdesc="Real-Time Terrain Rendering. Display high-resolution geospatial terrain data at real-time."
arch=('i686' 'x86_64')
url='https://code.google.com/p/libmini/'
license=('GPL')
provides=("$pkgname")

depends=('libsquish-svn' 'openscenegraph' 'glu')
makedepends=('cmake' 'subversion' 'tcsh')
optdepends=()
options=('staticlibs')
source=("${pkgname}::svn+http://libmini.googlecode.com/svn/libmini/mini")
md5sums=('SKIP')

pkgver() {
  svnversion "${SRCDEST}/${pkgname}" | tr -d [A-z]
}

prepare () {
	cd "${pkgname}"

	mkdir ./mini
	cp -rfv *.h ./mini

  sed -i "s#/usr/local/include#`pwd`#g" build.sh
}

build() {
  cd "${pkgname}"  

  tcsh ./build.sh lib useopenth && tcsh ./build.sh clean
  tcsh ./build.sh libsfx  useopenth && tcsh ./build.sh clean
  tcsh ./build.sh example && tcsh ./build.sh clean
  tcsh ./build.sh viewer && tcsh ./build.sh clean
  tcsh ./build.sh tools useopenth
}

package() {
  cd "${pkgname}"
  
  mkdir -p ${pkgdir}/usr/local/{bin,lib,share}

  tcsh ./build.sh install ${pkgdir}/usr/local ${pkgdir}/usr/local/share || return 1

  install -Dm755 "${srcdir}/${pkgname}/viewer" "${pkgdir}/usr/local/bin/"   
  install -Dm755 "${srcdir}/${pkgname}/tools/raw2db" "${pkgdir}/usr/local/bin/"   
  install -Dm755 "${srcdir}/${pkgname}/tools/rawquant" "${pkgdir}/usr/local/bin/"   
  install -Dm755 "${srcdir}/${pkgname}/tools/geo2ply" "${pkgdir}/usr/local/bin/"     

  install -D -m644 "${srcdir}/${pkgname}/libMini-app.cmake" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/minislicer.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_core.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_extra.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_format.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_generic.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_gfx.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_luna.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_math.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_object.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_sfx.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_tileset.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_util.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/mini_volume.h" "${pkgdir}/usr/local/include/mini/"  
  install -D -m644 "${srcdir}/${pkgname}/qt_viewer.h" "${pkgdir}/usr/local/include/mini/"  
}