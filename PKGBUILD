# Maintainer: Samuel Mesa <samuelmesa at linuxmail.org>

pkgname=tempus-wps-server
_pkgname=Tempus
pkgver=2.6.2
pkgrel=1
pkgdesc="Tempus is a C++ framework which offers generic graph manipulation abilities in order to develop multimodal path planning requests (WPS Server)"
arch=(i686 x86_64)
url="http://ifsttar.github.io/Tempus/"
license=('GNU LGPLv2+')
depends=('gdal' 'boost' 'postgresql' 'openmp' 'fcgi' 'libxml2' 'python-pyqt5' 'tempus-framework')
makedepends=('cmake' 'git')
optdepends=('qgis')
provides=()
conflicts=()
replaces=()
options=('!buildflags' '!makeflags')
source=("${_pkgname}::git://github.com/Ifsttar/Tempus.git#tag=v${pkgver}"
        "fix-pthread-fastcgi.patch")
md5sums=('SKIP'
         'd56421e9ac5a0be4b6bca99247708c59')  

prepare() {
  cd $_pkgname
  
  git submodule init && git submodule update   

  patch -Np0 < ../fix-pthread-fastcgi.patch
}

build() {     
  cd ${srcdir}/${_pkgname}/tempus_wps_server/
  [[ -d build ]] || mkdir build
  cd build

  cmake -G "Unix Makefiles" ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTEMPUS_INCLUDE_DIR=/usr/include \
    -DTEMPUS_LIBRARY=/usr/lib/libtempus.so \

  make 
}

package_tempus-wps-server() {
  cd ${srcdir}/${_pkgname}/tempus_wps_server/build
  make DESTDIR="$pkgdir" install

  install -d -m 0755 "$pkgdir/usr/share/tempus_wps_server/scripts/"
  for file in ../scripts/*.*; do 
    install -m 0644 $file "$pkgdir/usr/share/tempus_wps_server/scripts/$file"
  done
  
  install -Dm644 ../scripts/nginx/sites-available/default "$pkgdir/usr/share/tempus_wps_server/scripts/nginx/sites-available/default"  
}  