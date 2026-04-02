# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="fast_obj"
pkgver=1.3
_commit="61d43ee6f0cc440dc97983d36e0c85e80fe429d4"
pkgrel=1
pkgdesc="Single-header C/C++ library for loading Wavefront .obj files"
arch=(
  'x86_64'
)
url="https://github.com/thisistherk/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
makedepends=(
  'cmake>=3.22'
)
# checkdepends=(
#   'cmake>=3.0'
# )
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "${pkgname}-${_commit}-CMakeLists.txt::https://github.com/microsoft/vcpkg/raw/${_commit}/ports/fast-obj/CMakeLists.txt"
)
sha256sums=('f0f175edbe60db2099b3d8266ff0085b21862a17d9a1dc00fd195258c5b622b1'
            'b6373fdaa5ab0c8bba25d6377e6152282e5cda84feaff51c5ee046a0522390ae')

prepare() {
  cd "${srcdir}"
  cp -vf "${pkgname}-${_commit}-CMakeLists.txt" "${_pkgsrc}/CMakeLists.txt"

  cd "${_pkgsrc}"
  sed -e 's|add_library(fast-obj|add_library(fast-obj SHARED|g' \
      -i 'CMakeLists.txt'
}

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

# check() {
#   local cmake_options=(
#     -B "${_pkgsrc}/build"
#     -S "${_pkgsrc}"
#     -G 'Unix Makefiles'
#     -W no-dev
#     -D CMAKE_BUILD_TYPE:STRING='None'
#     -D CMAKE_INSTALL_PREFIX:PATH='/usr'
#     -D CMAKE_POLICY_VERSION_MINIMUM=3.5
#     -D FAST_OBJ_BUILD_TEST:BOOL=ON
#   )

#   cd "${srcdir}"
#   cmake "${cmake_options[@]}"
#   cmake --build "${cmake_options[1]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  # install -vDm644 "${pkgname}.h" "${pkgdir}/usr/include/${pkgname}.h"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
