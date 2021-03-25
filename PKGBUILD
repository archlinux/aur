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
source=(https://github.com/KhronosGroup/glslang/archive/${pkgver}.tar.gz wine-glslangValidator.sh)
sha256sums=('8ff2fcf9b054e4a4ef56fcd8a637322f827b2b176a592a618d63672ddb896e06'
            'ca9bc184d08a08905c7bc01956fbd76eb3a009e4346ff195846959b707f241e1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd glslang-$pkgver
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
