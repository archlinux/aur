pkgname=mingw-w64-glslang
pkgver=11.2.0
pkgrel=1
pkgdesc='OpenGL and OpenGL ES shader front end and validator (mingw-w64)'
arch=('any')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=('mingw-w64-spirv-tools')
makedepends=('mingw-w64-cmake' 'python')
optdepends=('mingw-w64-wine: runtime support')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/KhronosGroup/glslang/archive/${pkgver}.tar.gz wine-glslangValidator.sh
        git+https://github.com/KhronosGroup/SPIRV-Tools#commit=c79edd260c2b503f0eca57310057b4a100999cc5
        git+https://github.com/KhronosGroup/SPIRV-Headers#commit=75b30a659c8a4979104986652c54cc421fc51129)
sha256sums=('8ff2fcf9b054e4a4ef56fcd8a637322f827b2b176a592a618d63672ddb896e06' SKIP SKIP SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cp -r SPIRV-Tools glslang-${pkgver}/External/spirv-tools
  cp -r SPIRV-Headers glslang-${pkgver}/External/spirv-tools/external/spirv-headers
}

build() {
  cd glslang-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    sed "s|@TRIPLE@|${_arch}|g" "${srcdir}"/wine-glslangValidator.sh > ${_arch}-glslangValidator
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/glslang-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
#     ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    install -d "$pkgdir"/usr/bin
    install -m755 ${_arch}-glslangValidator "$pkgdir"/usr/bin
  done
}
