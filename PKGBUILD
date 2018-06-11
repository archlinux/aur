pkgname=mingw-w64-ilmbase
pkgver=2.2.1
pkgrel=1
pkgdesc="Base libraries from ILM for OpenEXR (mingw-w64)"
arch=(any)
url="http://www.openexr.com"
license=('custom')
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake")
options=('!buildflags' '!strip' 'staticlibs')
source=("http://download.savannah.nongnu.org/releases/openexr/ilmbase-$pkgver.tar.gz")
sha256sums=('cac206e63be68136ef556c2b555df659f45098c159ce24804e9d5e9e0286609e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ilmbase-$pkgver"
  sed -i "s|COMMAND eLut >|COMMAND touch|g" Half/CMakeLists.txt
  sed -i "s|COMMAND toFloat >|COMMAND touch|g" Half/CMakeLists.txt

  # useless test, besides g++ segfaults at testeuler.cpp
  sed -i "/ADD_SUBDIRECTORY ( ImathTest )/d" CMakeLists.txt

  # no clue how to fix this one properly
  #grep -lr LDBL_EPSILON Imath | xargs sed -i "s|LDBL_EPSILON|1.08420217248550443401e-19L|g"
  #grep -lr DBL_EPSILON Imath | xargs sed -i "s|DBL_EPSILON|2.2204460492503131E-16|g"
  #grep -lr FLT_EPSILON Imath | xargs sed -i "s|FLT_EPSILON|1.19209290E-07F|g"
}

build() {
  cd "${srcdir}/ilmbase-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DNAMESPACE_VERSIONING=OFF ..
    g++ -o Half/eLut ../Half/eLut.cpp
    g++ -o Half/toFloat ../Half/toFloat.cpp
    ./Half/eLut > ./Half/eLut.h
    ./Half/toFloat > ./Half/toFloat.h
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/ilmbase-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    install -d "$pkgdir"/usr/${_arch}/bin
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a  
  done
}

