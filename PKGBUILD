# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-openjpeg2
pkgver=2.5.3
pkgrel=1
pkgdesc="An open source JPEG 2000 codec, version ${pkgver} (mingw-w64)"
arch=('any')
url="https://www.openjpeg.org"
license=('BSD-2-Clause' 'MIT')
depends=('mingw-w64-libpng'
         'mingw-w64-lcms2')
makedepends=('mingw-w64-cmake')
options=('!strip' 'staticlibs' '!buildflags')
source=("openjpeg-${pkgver}.tar.gz::https://github.com/uclouvain/openjpeg/archive/v${pkgver}.tar.gz"
        "0003-versioned-dlls.mingw.patch")
sha256sums=('368fe0468228e767433c9ebdea82ad9d801a3ad1e4234421f352c8b06e7aa707'
            '787cee06732de997a3a99b6a40676ea9335388d3a706071b6f266f7c47822197')

prepare() {
  cd openjpeg-${pkgver}
  sed -i '/add_subdirectory(thirdparty)/d' CMakeLists.txt
  patch -p1 -i "${srcdir}"/0003-versioned-dlls.mingw.patch
}

build() {
  cd openjpeg-${pkgver}
  for _arch in ${_architectures}; do
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
    cd "${srcdir}/openjpeg-${pkgver}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    cd "${srcdir}/openjpeg-${pkgver}/build-${_arch}-shared"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    find "${pkgdir}/usr/${_arch}/lib" -name '*.dll' -exec mv {} "${pkgdir}/usr/${_arch}/bin" \;
  done
}

# vim:set ts=2 sw=2 et:
