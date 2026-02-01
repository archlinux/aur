# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="devil"
pkgname="lib32-${_name}"
pkgver=1.8.0
pkgrel=1
pkgdesc="Library for reading several different image formats (32-bit)"
arch=(
  'x86_64'
)
url="https://sourceforge.net/projects/openil/"
license=(
  'LGPL-2.1-only'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
  # 'lib32-jasper'
  'lib32-lcms2'
  'lib32-libjpeg-turbo'
  'lib32-libpng'
  'lib32-libtiff'
)
makedepends=(
  'cmake>=2.6'
)
provides=(
  'libIL.so'
  'libILU.so'
  'libILUT.so'
)
_pkgsrc="DevIL" #-${pkgver}"
source=(
  "https://downloads.sourceforge.net/openil/${_pkgsrc}-${pkgver}.tar.gz"
  "${_name}_soversion.patch"
  "${_name}_jasper.patch"
)
sha256sums=('0075973ee7dd89f0507873e2580ac78336452d29d34a07134b208f44e2feb709'
            'f6ef4b428fd68f0fb837af548d20ffa5ca96f3e8e4f57faca8f5a90dc48b0377'
            'a3e1009e70be5a159250e3ea30d39f5aef1fa23eacece79e72deda51d7200159')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # Add solib version number to CMakeLists.txt
  # https://github.com/DentonW/DevIL/pull/50
  patch -Np1 -i "${srcdir}/${_name}_soversion.patch"
  # https://github.com/DentonW/DevIL/commit/42a62648e727e9a0217280474546de3ac69cbff1
  patch -Np1 -i "${srcdir}/${_name}_jasper.patch"

  find . -type f -name 'CMakeLists.txt' -exec \
    sed -e '/find_package(Jasper)/d' \
        -e '/find_package(libSquish)/d' \
        -e 's/DESTINATION lib/DESTINATION lib32/g' \
        -i "{}" +
  find . -type f -name '*.pc.cmake.in' -exec \
    sed -e 's|/lib|/lib32|g' \
        -i "{}" +
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    # -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    # -D IL_NO_JP2:BOOL=ON # tmp, fails to build
    # -D IL_USE_DXTC_SQUISH:BOOL=ON # disabled by Arch?
  )
  
  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}/DevIL" "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

# check() {
#   local excluded_tests=""
#   local ctest_flags=(
#     --test-dir "${_pkgsrc}/build"
#     --output-on-failure
#     --parallel "$(nproc)"
#     --exclude-regex "${excluded_tests}"
#   )

#   cd "${srcdir}"
#   ctest "${ctest_flags[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
