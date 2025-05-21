# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="qt"
_commit_rel="737c792a14570be12ec24514552fde949cc4dd5a" # 2.3.2
_commit="6f380baa9866bce8ccc34e166dfeca3ff3cd978e" # r63
pkgver=2.3.2+kde+r63
_name="${_basename}${pkgver%%.*}"
pkgname="lib32-${_name}"
pkgrel=1
pkgdesc="A cross-platform application and UI framework (32-bit)"
arch=('x86_64')
url="https://www.qt.io"
_url="https://invent.kde.org/sandsmark/${_name}"
license=('QPL-1.0 OR GPL-2.0-only')
depends=('lib32-fontconfig' 'lib32-gcc-libs' 'lib32-glibc' 'lib32-libgl'
         'lib32-libice' 'lib32-libjpeg-turbo' 'lib32-libmng' 'lib32-libpng'
         'lib32-libsm' 'lib32-libx11' 'lib32-libxext' 'lib32-libxft'
         'lib32-libxmu' 'lib32-zlib' "${_name}>=${pkgver}")
makedepends=('byacc' 'cmake>=3.2' 'lib32-glu' 'lib32-freeglut' 'libxft')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${_commit}/${_pkgsrc}.tar.gz")
b2sums=('1d68e61f41a2b059e5319374875503421ba5ed0165f046808b38827bbae466527146b431c0900a7a14e2deccaebf08dbd0b78ff37de711b6ad9435a0661119c2')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e '/set(CMAKE_VERBOSE_MAKEFILE ON)/d' \
      -e '/add_subdirectory(tools)/d' \
      -e '/add_subdirectory(doc)/d' \
      -i 'CMakeLists.txt'
  
  cd "src"
  sed -i '/add_subdirectory(moc)/d' 'CMakeLists.txt'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR='lib32'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
