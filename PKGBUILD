pkgname=mingw-w64-openjpeg2
pkgver=2.2.0
pkgrel=1
arch=(any)
pkgdesc="An open source JPEG 2000 codec, version ${pkgver} (mingw-w64)"
license=("custom: BSD")
depends=(mingw-w64-libpng mingw-w64-lcms2)
makedepends=(mingw-w64-cmake)
options=(staticlibs !strip !buildflags)
url="https://www.openjpeg.org"
source=("https://github.com/uclouvain/openjpeg/archive/v$pkgver.tar.gz"
"0001-fix-install-for-dlls.all.patch"
"0003-versioned-dlls.mingw.patch"
"0005-sock-jpip.all.patch")
sha256sums=('6fddbce5a618e910e03ad00d66e7fcd09cc6ee307ce69932666d54c73b7c6e7b'
            '3f3bde353ca3432f157258164c5e3c345af82ca3a9d5a68f815c3030b01cbc32'
            'a221300d278f1a57b1ea5c70314702cd4234a2560ed2335bd5940fd921e78eda'
            'b7b22dca26d5fd98ca5bc6ce775bbbabebc0e10fcf07fd0afb54d580699b8312')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd openjpeg-$pkgver
  sed -i '/add_subdirectory(thirdparty)/d' CMakeLists.txt
  patch -p1 -i ${srcdir}/0001-fix-install-for-dlls.all.patch
  patch -p1 -i ${srcdir}/0003-versioned-dlls.mingw.patch
  patch -p1 -i ${srcdir}/0005-sock-jpip.all.patch
}

build() {
	cd openjpeg-$pkgver
	for _arch in ${_architectures}; do
    unset LDFLAGS
    
    mkdir "build-${_arch}-static" && pushd "build-${_arch}-static"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_DOC=OFF \
      -DBUILD_TESTING=OFF \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd
    
    mkdir "build-${_arch}-shared" && pushd "build-${_arch}-shared"
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_DOC=OFF \
      -DBUILD_TESTING=OFF \
      -DBUILD_PKGCONFIG_FILES=ON \
      ..
    make
    popd
  done
}

package() {
	for _arch in ${_architectures}; do
    cd "${srcdir}/openjpeg-$pkgver/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/openjpeg-$pkgver/build-${_arch}-shared"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    find "$pkgdir/usr/${_arch}/lib" -name '*.dll' -exec mv {} "$pkgdir/usr/${_arch}/bin" \;
  done
}
