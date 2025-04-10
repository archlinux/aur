# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libyuv"
pkgname="lib32-${_name}"
_commit="464c51a0353c71f08fe45f683d6a97a638d47833" # r2426
pkgver="r2426+${_commit::9}"
pkgrel=1
pkgdesc="Library for YUV scaling (32-bit)"
arch=('x86_64')
url="https://chromium.googlesource.com/libyuv/libyuv"
license=('LicenseRef-libavif')
depends=('lib32-gcc-libs' 'lib32-glibc' 'lib32-libjpeg-turbo' "${_name}>=${pkgver}")
makedepends=('cmake>=2.8.12' 'git') # 'lib32-gtest'
provides=("${_name}.so")
source=("git+${url}#commit=${_commit}")
sha512sums=('1a149818c4cddaef7963606cac5d6f1e2b6ccf700507ceca7e77f3206853c5f6818044c12af362d1f065c63e1aa9a8f3fde052e86841773417eb98f8ad2d8c69')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "r%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
  cd "${srcdir}/${_name}"
  sed -e 's|yuvconvert ${JPEG_LIBRARY}|${ly_lib_shared} ${JPEG_LIBRARY}|' \
      -e 's|DESTINATION lib|DESTINATION lib32|g' \
      -e '/DESTINATION include/d' \
      -e '/yuvconvert/d' \
      -e '/yuvconstants/d' \
      -i 'CMakeLists.txt'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_name}/build"
    -S "${_name}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    # -DCMAKE_INSTALL_LIBDIR='lib32'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DTEST:BOOL=OFF
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_name}/build"
}

# check() {
#   local excluded_tests=""
#   local ctest_flags=(
#     --test-dir "${_name}/build"
#     --output-on-failure
#     --parallel $(nproc)
#     --exclude-regex "${excluded_tests}"
#   )
# 
#   cd "${srcdir}"
#   ctest "${ctest_flags[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_name}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
