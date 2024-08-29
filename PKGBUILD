# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="paper-soccer"
pkgver=1.0.1
pkgrel=3
pkgdesc="A networked version of paper soccer game in modern console"
arch=('x86_64')
url="https://github.com/MateuszJanda/${pkgname}"
license=('MIT')
makedepends=('boost' 'cmake>=3.18')
checkdepends=('gtest' 'gmock')
depends=('boost-libs' 'gcc-libs' 'glibc' 'ncurses' 'protobuf')
_pkgsrc="${pkgname}-${pkgver}"
_gtestsrc="googletest-${_gtest_abbrev}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('09cde23ce2b02a59725b495107ab55058c47e4d532f3dedc47909f7133b6a8c6')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i '/^add_subdirectory(lib\/googletest EXCLUDE_FROM_ALL)$/s/^/# /' CMakeLists.txt
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DGTEST_INCLUDE_DIR:PATH='/usr/include/gtest' \
    -DGMOCK_INCLUDE_DIR:PATH='/usr/include/gmock' \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}/${_pkgsrc}/build"
  make runTests
  ./runTests || exit 1
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
