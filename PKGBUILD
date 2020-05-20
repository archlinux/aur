pkgname=mingw-w64-shaderc
pkgver=2020.0
pkgrel=1
pkgdesc='Collection of tools, libraries and tests for shader compilation (mingw-w64)'
url='https://github.com/google/shaderc'
arch=('any')
license=('Apache')
depends=('mingw-w64-glslang')
makedepends=('mingw-w64-cmake' 'mingw-w64-spirv-headers' 'python')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/google/shaderc/archive/v${pkgver}.tar.gz)
sha256sums=('e02e2a9d4c3960bc629ca8cdcf83d295bec9c80ed08a8c5062e4e294022605ec')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd shaderc-$pkgver
  curl -L https://github.com/google/shaderc/pull/463.patch | patch -p1

  # de-vendor libs and disable git versioning
  sed '/examples/d;/third_party/d' -i CMakeLists.txt
  sed '/build-version/d' -i glslc/CMakeLists.txt
  cat <<- EOF > glslc/src/build-version.inc
"${pkgver}\\n"
"$(pacman -Q mingw-w64-spirv-tools|cut -d \  -f 2|sed 's/-.*//')\\n"
"$(pacman -Q mingw-w64-glslang|cut -d \  -f 2|sed 's/-.*//')\\n"
EOF
}

build() {
  cd shaderc-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DSHADERC_SKIP_TESTS=ON \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/shaderc-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
