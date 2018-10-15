# Maintainer: Samuel Mesa <samuelmesa at linuxmail.org>

pkgbase=tempus-framework
pkgname=('tempus-core' 'tempus-wps-server')
_pkgname=Tempus
pkgver=2.6.2
pkgrel=1
pkgdesc="Tempus is a C++ framework which offers generic graph manipulation abilities in order to develop multimodal path planning requests. It features."
arch=(i686 x86_64)
url="http://ifsttar.github.io/Tempus/"
license=('GNU LGPLv2+')
depends=('gdal' 'boost' 'postgresql' 'openmp' 'fcgi' 'libxml2' 'python-pyqt5')
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
  cd ${srcdir}/${_pkgname}/tempus_core/
  [[ -d build ]] || mkdir build
  cd build

  cmake -G "Unix Makefiles" ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_CORE=TRUE \
    -DBUILD_DOC=TRUE \
    -DBUILD_TOOLS=TRUE \
    -DBUILD_TEMPUS_PLUGINS=TRUE

  make
}

package_tempus-core() {
  cd ${srcdir}/${_pkgname}/tempus_core/build

  make DESTDIR="$pkgdir" install

  install -d -m 0755 "$pkgdir/usr/share/tempus/test_data/"
  for file in ../test_data/*; do 
    install -m 0644 $file "$pkgdir/usr/share/tempus/test_data/$file"
  done

  export TEMPUS_CORE_DIR="$pkgdir/"
}  

package_tempus-wps-server() {
  cd ${srcdir}/${_pkgname}/tempus_wps_server/
  [[ -d build ]] || mkdir build
  cd build

  cmake -G "Unix Makefiles" ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTEMPUS_INCLUDE_DIR=$TEMPUS_CORE_DIR/usr/include \
    -DTEMPUS_LIBRARY=$TEMPUS_CORE_DIR/usr/lib/libtempus.so \

  make 

  make DESTDIR="$pkgdir" install

  install -d -m 0755 "$pkgdir/usr/share/tempus_wps_server/scripts/"
  for file in ../scripts/*.*; do 
    install -m 0644 $file "$pkgdir/usr/share/tempus_wps_server/scripts/$file"
  done
  
  install -Dm644 ../scripts/nginx/sites-available/default "$pkgdir/usr/share/tempus_wps_server/scripts/nginx/sites-available/default"  
}  