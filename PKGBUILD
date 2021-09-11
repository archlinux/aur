pkgname=mingw-w64-shaderc
pkgver=2021.2
pkgrel=1
pkgdesc='Collection of tools, libraries and tests for shader compilation (mingw-w64)'
url='https://github.com/google/shaderc'
arch=('any')
license=('Apache')
depends=('mingw-w64-glslang')
makedepends=('mingw-w64-cmake' 'mingw-w64-spirv-headers' 'mingw-w64-spirv-tools' 'python')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://github.com/google/shaderc/archive/v${pkgver}.tar.gz
		"0001-fix-glslang-hlsl-linking-order.patch")
sha256sums=('d0d75beced49c7a03ae30bb4a879a3c7f2218ad66af19a115f665d07f37167ba'
			'7d9c2605a4dab0e718c7fd3c7bfa2ea80968d8caa1937d8f0eaee3dc7c2f4e1d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd shaderc-$pkgver
  
  # https://www.mail-archive.com/devel@lists.fedoraproject.org/msg156020.html
  patch -Nbp1 -i "${srcdir}/0001-fix-glslang-hlsl-linking-order.patch"
  
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
  local -a _glslang_inc
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
	_glslang_inc="/usr/${_arch}/include/glslang"
    ${_arch}-cmake \
	  -Dglslang_SOURCE_DIR=${_glslang_inc} \
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
