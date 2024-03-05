pkgname=mingw-w64-glslang
pkgver=14.0.0
pkgrel=1
pkgdesc='OpenGL and OpenGL ES shader front end and validator (mingw-w64)'
arch=('any')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'python' 'git')
optdepends=('mingw-w64-wine: runtime support')
options=('!strip' '!buildflags' 'staticlibs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/glslang/archive/${pkgver}.tar.gz)
sha256sums=('80bbb916a23e94ea9cbfb1acb5d1a44a7e0c9613bcf5b5947c03f2273bdc92b0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd glslang-$pkgver
  curl -L https://github.com/KhronosGroup/glslang/pull/3487.patch | patch -p1
}

build() {
  cd glslang-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release -DENABLE_OPT=1 -DALLOW_EXTERNAL_SPIRV_TOOLS=ON \
      ..
    make
    echo -e "#!/bin/sh\n${_arch}-wine /usr/${_arch}/bin/glslang.exe \"\$@\"" > ${_arch}-glslang
    popd
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release -DENABLE_OPT=1 -DALLOW_EXTERNAL_SPIRV_TOOLS=ON \
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
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    install -d "$pkgdir"/usr/bin
    install -m755 ${_arch}-glslang "$pkgdir"/usr/bin
  done
}
