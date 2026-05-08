# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="paper-soccer"
pkgver=1.0.1
pkgrel=4
pkgdesc="A networked version of paper soccer game in modern console"
arch=(
  'x86_64'
)
url="https://github.com/MateuszJanda/${pkgname}"
license=(
  'MIT'
)
depends=(
  'abseil-cpp'
  'boost-libs'
  'glibc'
  'libgcc'
  'libstdc++'
  'ncurses'
  'protobuf'
)
makedepends=(
  'boost'
  'cmake>=3.18'
)
checkdepends=(
  'gtest'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('09cde23ce2b02a59725b495107ab55058c47e4d532f3dedc47909f7133b6a8c6')

_cmake_options=(
  -B "${_pkgsrc}/build"
  -S "${_pkgsrc}"
  -G 'Unix Makefiles'
  -W no-dev
  -D CMAKE_BUILD_TYPE:STRING='None'
  -D CMAKE_INSTALL_PREFIX:PATH='/usr'
)

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e '/add_subdirectory(lib\/googletest/d' \
      -i 'CMakeLists.txt'
  sed -e 's/Boost REQUIRED COMPONENTS system/Boost REQUIRED/g' \
      -i 'src/CMakeLists.txt'
}

build() {
  # TODO
  export CFLAGS="$(pkg-config --cflags absl_check) ${CFLAGS}"
  export LDFLAGS="$(pkg-config --libs absl_check) ${LDFLAGS}"

  cd "${srcdir}"
  cmake "${_cmake_options[@]}"
  cmake --build "${_cmake_options[1]}"
}

check() {
  cd "${srcdir}"
  cmake --build "${_cmake_options[1]}" --target runTests

  cd "${_cmake_options[1]}"
  ./runTests
}

package() {
  cd "${srcdir}"
  # DESTDIR="${pkgdir}" cmake --install "${_cmake_options[1]}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "build"
  install -vDm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
