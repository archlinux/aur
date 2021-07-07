pkgname=mingw-w64-glslang
pkgver=11.5.0
pkgrel=2
pkgdesc='OpenGL and OpenGL ES shader front end and validator (mingw-w64)'
arch=('any')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'python' 'git')
optdepends=('mingw-w64-wine: runtime support')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/KhronosGroup/glslang/archive/${pkgver}.tar.gz wine-glslangValidator.sh
        git+https://github.com/KhronosGroup/SPIRV-Tools#commit=dc72924cb31cd9f3dbc3eb47e9d926cf641e3a07
        git+https://github.com/KhronosGroup/SPIRV-Headers#commit=dafead1765f6c1a5f9f8a76387dcb2abe4e54acd)
sha256sums=('fd0b5e3bda591bb08bd3049655a99a0a55f0de4059b9c8f7b397e4b19cf5d51f' SKIP SKIP SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cp -r SPIRV-Tools glslang-${pkgver}/External/spirv-tools
  cp -r SPIRV-Headers glslang-${pkgver}/External/spirv-tools/external/spirv-headers

  cd glslang-$pkgver
}

build() {
  cd glslang-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      ..
    make
    sed "s|@TRIPLE@|${_arch}|g" "${srcdir}"/wine-glslangValidator.sh > ${_arch}-glslangValidator
    popd
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/glslang-${pkgver}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    cd "${srcdir}/glslang-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    # Delete the stuff that's been vendored in. It's not ideal but that's we'll deal with for now.
    mv "${pkgdir}"/usr/${_arch}/bin/spirv-remap.exe .
    rm -r "${pkgdir}"/usr/${_arch}/{bin/spirv*,bin/libSPIRV-Tools*,include/spirv-tools,SPIRV-Tools*,lib/libSPIRV-Tools*,lib/pkgconfig}
    mv spirv-remap.exe "${pkgdir}"/usr/${_arch}/bin/spirv-remap.exe
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    install -d "$pkgdir"/usr/bin
    install -m755 ${_arch}-glslangValidator "$pkgdir"/usr/bin
  done
}
