pkgname=mingw-w64-glslang
pkgver=11.10.0
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
sha256sums=('8ffc19c435232d09299dd2c91e247292b3508c1b826a3497c60682e4bbf2d602')

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
      ..
    make
    echo -e "#!/bin/sh\n${_arch}-wine /usr/${_arch}/bin/glslangValidator.exe \"\$@\"" > ${_arch}-glslangValidator
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
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    install -d "$pkgdir"/usr/bin
    install -m755 ${_arch}-glslangValidator "$pkgdir"/usr/bin
  done
}
