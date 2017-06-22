# Submitter: Eugen Zagorodniy <https://github.com/ezag>
# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=libkml
pkgver=1.3.0
pkgrel=0
pkgdesc="A KML library written in C++ with bindings to other languages"
arch=(i686 x86_64)
url="https://github.com/libkml/libkml"
license=('BSD')
depends=('expat' 'uriparser')
optdepends=('swig: bindings for additional languages'
            'python2: python bindings')
makedepends=('cmake' 'swig')            
# TODO: Use existing libminizip package instead of conflicting with it.
conflicts=('libminizip')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e663141e9ebd480538b25d226e1b2979')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  if [ -f CMakeCache.txt ]  
    then
    rm -rf CMakeCache.txt CMakeFiles
  fi  
  rm -rf build && mkdir build
  cd build

   cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_SWIG=ON \
    -DWITH_PYTHON=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPYTHON_LIBRARIES=/usr/lib/python2.7 \
    -DPYTHON_INCLUDE_PATH=/usr/include/python2.7 \
    -DBUILD_EXAMPLES=OFF

  # Add --disable-python or --disable-java to configure flags if your
  # system doesn't have corresponding language.

  make clean
  make -j2

}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd build

  make || return 1
  make DESTDIR=${pkgdir} install

  # TODO: Remove uriparser sources before building and use existing package.
  #rm "${pkgdir}/usr/lib/liburiparser."{{,l}a,so{,.1{,.0.5}}}
  #rm "${pkgdir}/usr/lib/libminizip."{{,l}a,so{,.0}}
  #mkdir -p "${pkgdir}/share/licenses/${pkgname}"
  #cp COPYING "${pkgdir}/share/licenses/${pkgname}/"
}
