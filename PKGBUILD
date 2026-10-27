# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Maël Lavault <moimael@neuf.fr>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>
# Maintainer: Alireza S.N. <alireza6677@gmail.com> 

pkgname=libkml-git
_pkgname=libkml
pkgver=1.3.0.r130.g878abd1
pkgrel=3
pkgdesc="A KML library written in C++ with bindings to other languages"
arch=('i686' 'x86_64')
url="https://github.com/libkml/libkml"
license=('BSD')
depends=('expat' 'uriparser')
optdepends=('swig: bindings for additional languages'
            'python2: python bindings')
makedepends=('cmake3' 'swig' 'boost' 'patchelf' 'git')
provides=('libkml')
conflicts=('libkml')
source=("${_pkgname}::git+https://github.com/libkml/libkml.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    ( set -o pipefail
      git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
  cd ${_pkgname}
  git checkout synced_upstream

  # Newer Boost instantiates intrusive_ptr(T*) eagerly, which fails for
  # set_x(NULL) on forward-declared types (ADL can't find the Referent hooks).
  # Use the default constructor instead.
  sed -i \
    -e 's/set_country(NULL)/set_country(XalCountryPtr())/' \
    -e 's/set_locality(NULL)/set_locality(XalLocalityPtr())/' \
    -e 's/set_subadministrativearea(NULL)/set_subadministrativearea(XalSubAdministrativeAreaPtr())/' \
    -e 's/set_thoroughfare(NULL)/set_thoroughfare(XalThoroughfarePtr())/' \
    -e 's/set_postalcode(NULL)/set_postalcode(XalPostalCodePtr())/' \
    src/kml/dom/xal.h
  sed -i 's/set_model(NULL)/set_model(ModelPtr())/' src/kml/dom/geometry.h
  sed -i 's/set_gx_playlist(NULL)/set_gx_playlist(GxPlaylistPtr())/' src/kml/dom/gx_tour.h
}

build() {
  cd ${_pkgname}

  if [ -f CMakeCache.txt ]  
    then
    rm -rf CMakeCache.txt CMakeFiles
  fi  

  rm -rf build && mkdir build
  cd build

   cmake3 .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DWITH_SWIG=OFF \
    -DWITH_PYTHON=OFF \
    -DBUILD_EXAMPLES=OFF

  # Add --disable-python or --disable-java to configure flags if your
  # system doesn't have corresponding language.

  make clean
  make 
}

package() {
  cd ${_pkgname}
  cd build

  make || return 1
  make DESTDIR=${pkgdir} install
  patchelf --add-needed liburiparser.so.1 $pkgdir/usr/lib/libkmlbase.so
}
