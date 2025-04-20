# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_name="srt"
pkgname="lib32-${_name}"
pkgver=1.5.4
pkgrel=1
pkgdesc="Secure Reliable Transport library (32-bit)"
arch=('x86_64')
url="https://www.srtalliance.org"
_url="https://github.com/Haivision/${_name}"
license=('MPL-2.0')
depends=('lib32-gcc-libs' 'lib32-glibc' 'lib32-openssl' "${_name}>=${pkgver}")
makedepends=('cmake>=2.8.12' 'git')
provides=("lib${_name}.so")
source=("git+${_url}.git#tag=v${pkgver}")
b2sums=('d0d7be25c29a3ce8ada61d721813a8a5235751dfc0e2fa28072e3b9fb5bc9131da405db0cc5163339ba14bf05ddec1a861ceee749a31c171d61555885921ea39')

prepare() {
  cd "${srcdir}/${_name}"
  sed -i '/set (CMAKE_BUILD_TYPE/d' 'CMakeLists.txt'
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
    -W no-dev
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
  cmake --build "${_name}/build"
}

# check() {
#   cd "${srcdir}/${_name}/build"
#   ./uriparser-test
#   ./utility-test
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_name}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
