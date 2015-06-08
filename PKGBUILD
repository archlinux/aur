
pkgname=mingw-w64-netcdf
pkgver=4.3.2
pkgrel=1
pkgdesc="network Common Data Form interface for array-oriented data access and corresponding library (mingw-w64)"
arch=('any')
url="http://www.unidata.ucar.edu/downloads/netcdf/index.jsp"
depends=('mingw-w64-crt' 'mingw-w64-hdf5' 'mingw-w64-curl')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
license=('custom')
source=(http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-${pkgver}.tar.gz)
sha1sums=('6e1bacab02e5220954fe0328d710ebb71c071d19')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/netcdf-${pkgver}"
  sed -i "s|cp liblib/netcdfdll.def \${prefix}/lib|cp liblib/netcdfdll.def \$(DESTDIR)\${prefix}/bin|g" Makefile.am
  autoreconf -vfi 
}

build() {
  cd "${srcdir}/netcdf-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --enable-dll --enable-netcdf-4
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/netcdf-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm "$pkgdir"/usr/${_arch}/bin/*.def
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
