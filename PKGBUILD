# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="qt"
_commit_rel="84e6a4bc7ffaa002a2f698ac3acba7f774343754" # 1.45
_commit="25d30943816da9c28cded9ac7ce23b94c2ff2a5c" # r18
pkgver="1.45+kde+r18"
_name="${_basename}${pkgver%%.*}"
pkgname="lib32-${_name}"
pkgrel=1
pkgdesc="A cross-platform application and UI framework (32-bit)"
arch=('x86_64')
url="https://www.qt.io"
_url="https://invent.kde.org/historical/qt1"
license=('QPL-1.0')
depends=('lib32-gcc-libs' 'lib32-glibc' 'lib32-libgl' 'lib32-libx11'
         'lib32-libxext' 'lib32-libxmu' "${_name}>=${pkgver}")
makedepends=('byacc' 'cmake>=3.2' 'lib32-glu')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${_commit}/${_pkgsrc}.tar.gz"
        "${_name}_format_security.patch")
b2sums=('1b877df2fac9a0ce2657771cda709c1da7a773cb793552b7222f9d56430b413d06a994fa13c622f8794460760de14bda65f0412c0ca8c630bd47671fc271c4d8'
        '90df6c023f65d760aa1637889445c2319fd3f7f1b221837faec7008179432b89f4ec700daf1bac6198114e3cf3f7f459edf5c84c1eb18c287ce9c23447839357')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_format_security.patch"

  # shellcheck disable=SC2016
  sed -e '/set(CMAKE_VERBOSE_MAKEFILE ON)/d' \
      -e 's|${CMAKE_INSTALL_DOCDIR}|${CMAKE_INSTALL_DOCDIR}/html|g' \
      -i 'CMakeLists.txt'
  
  cd "src"
  # shellcheck disable=SC2016
  sed -e 's|${CMAKE_INSTALL_DATADIR}/cmake|${CMAKE_INSTALL_LIBDIR}/cmake|g' \
      -e '/add_subdirectory(moc)/d' \
      -i 'CMakeLists.txt'
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
    -D BUILD_QT1_TUTORIAL:BOOL=OFF
    -D BUILD_QT1_EXAMPLES:BOOL=OFF
    -D INSTALL_QT_DOCS:BOOL=OFF
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

# vim:set ts=2 sw=2 et:
