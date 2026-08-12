# Maintainer: Bink
pkgname=ktx-software
pkgver=4.4.2
pkgrel=2
pkgdesc="KTX (Khronos Texture) Library and Tools"
arch=(x86_64)
url='https://github.com/KhronosGroup/KTX-Software'
license=('Apache-2.0')
depends=(
  zlib
  libpng
  libjpeg-turbo
  openexr
)
makedepends=(
  cmake
  gcc15
  ninja
  zstd
)
provides=(ktx-software)
conflicts=(
  ktx-software
  ktx_software
)
source=("https://github.com/KhronosGroup/KTX-Software/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9412cb45045a503005acd47d98f9e8b47154634a50b4df21e17a1dfa8971d323')
b2sums=('3e3951fc8904d9bcd7c2e25502248f8af18830d6a7273a4666268d84f9e09fba610ea8dbd7b6088630c56f9ca7efc4ef001988cf257f90f1cf06a01aabfcb388')

build() {
  cd "${srcdir}/KTX-Software-${pkgver}" || exit

  # Hitting build errors when using GCC 16, so force using GCC 15.
  # I'll drop GCC 15 use once upstream supports GCC 16.
  #
  # external/basisu/encoder/basisu_kernels_sse.cpp is SSE4.1-only resulting in build
  # errors when using -march=native or -march=x86-64-v3 / x86-64-v4 as compiler options,
  # as those enable unsupported AVX.
  #
  # Upstream have updated that file to compile with newer instruction sets, but
  # the fix is not in a release build yet. For now I'm disabling AVX on that file only.

  cat > "${srcdir}/ktx-sse-no-avx.cmake" <<'EOF'
cmake_language(DEFER CALL set_property
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/external/basisu/encoder/basisu_kernels_sse.cpp"
    APPEND PROPERTY COMPILE_OPTIONS "-mno-avx"
)
EOF

  cmake -G Ninja -B build -S . \
        -DCMAKE_BUILD_TYPE=None \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_COMPILER=gcc-15 \
        -DCMAKE_CXX_COMPILER=g++-15 \
        -DCMAKE_C_FLAGS="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -msse4.1" \
        -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
        -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
        "-DCMAKE_PROJECT_KTX-Software_INCLUDE=${srcdir}/ktx-sse-no-avx.cmake" \
        -DKTX_GIT_VERSION_FULL="v${pkgver}"
  cmake --build build
}

package() {
  cd "${srcdir}/KTX-Software-${pkgver}" || exit
  DESTDIR="${pkgdir}" cmake --install build
}
