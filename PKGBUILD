pkgname=mingw-w64-openjpeg2
pkgver=2.1.2
pkgrel=2
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
md5sums=('40a7bfdcc66280b3c1402a0eb1a27624'
         'c71b7576d88fdd7613f318297cb0c8be'
         'f8fd65a4d5b1dfc219b648325d33b389'
         'f4f5174de862b6803702d6eaa83da4da')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd openjpeg-$pkgver
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
