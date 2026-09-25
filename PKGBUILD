# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_name="srt"
pkgname="lib32-${_name}"
pkgver=1.5.7
pkgrel=1
pkgdesc="Secure Reliable Transport library (32-bit)"
arch=(
  'x86_64'
)
url="https://www.srtalliance.org"
_url="https://github.com/Haivision/${_name}"
license=(
  'MPL-2.0'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-openssl'
)
makedepends=(
  'cmake>=2.8.12'
  'git'
)
provides=(
  "lib${_name}.so"
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}"
)
b2sums=('6287246e06dcc8d9e9ed7a36df1826f12ea2a15e87a9cca8845744bf127292735861d5c8818b94428d5bd07b28ccf7602f092fe1e4ccfd479bceb8446281296e')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i '/set (CMAKE_BUILD_TYPE/d' 'CMakeLists.txt'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-author
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR='lib32'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D ENABLE_STATIC:BOOL=OFF
    -D ENABLE_APPS:BOOL=OFF
    # -D ENABLE_TESTING:BOOL=ON
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/build"
#   ./uriparser-test
#   ./utility-test
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
