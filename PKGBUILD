# Maintainer: M0Rf30
# Contributor: carlsagan12

pkgbase=dakota
pkgname=dakota
pkgver=6.11.0
pkgrel=1
pkgdesc="A flexible, extensible interface between analysis codes and iterative systems analysis methods"
arch=(i686 x86_64)
url="https://dakota.sandia.gov/"
license=('LGPL')
depends=('boost' 'cddlib' 'icu' 'lapack' 'openmotif' 'tinyxml')
makedepends=('cmake' 'gcc-fortran' 'python2')
options=(!strip)
_filename=$pkgname-$pkgver-release-public.src-UI
_srcname=$pkgname-$pkgver-release-public.src-UI
source=("https://dakota.sandia.gov/sites/default/files/distributions/public/${_filename}.tar.gz")
sha512sums=('484d3c4483be9750b1f6c7fb6a13148a1e2811231899cc07d9a478a18f8b9d9080b2c2ca628c7657af907d4f4e0e9405a41ca35d8d58828b343b71e374a2f480')

build() {
  cd "$srcdir/${_filename}"
  if [ ! -d build ]; then
    mkdir build
  fi  
  cd build
  cmake .. -Wno-dev -DPYTHON_EXECUTABLE=/usr/bin/python2 \
                    -DCMAKE_INSTALL_PREFIX=/usr \
                    -DDAKOTA_F90=OFF \
		    -DCMAKE_CXX_FLAGS="-fpermissive"
  make -j4
  
}

package() {
  cd $srcdir/${_filename}
  cd build
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/include/{cblas.h,tinystr.h,tinyxml.h}
  rm $pkgdir/usr/lib/libtinyxml.so
  rm -rf $pkgdir/usr/examples
  rm $pkgdir/usr/include/menu.h
  rm $pkgdir/usr/include/cdd.h
  rm $pkgdir/usr/include/cddmp.h
  rm $pkgdir/usr/include/cddtypes.h
  rm $pkgdir/usr/include/setoper.h

}
