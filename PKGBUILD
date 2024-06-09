# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname=paper-soccer
pkgver=1.0.1
pkgrel=1
_gtest_abbrev="ca4b7c9ff4d8a5c37ac51795b03ffe934958aeff"
pkgdesc="A networked version of paper soccer game in modern console"
arch=('any')
url="https://github.com/MateuszJanda/paper-soccer"
license=('MIT')
depends=('protobuf' 'boost-libs' 'ncurses')
makedepends=('cmake' 'gcc' 'protobuf' 'boost' 'ncurses')
_pkgsrc="${pkgname}-${pkgver}"
_gtestsrc="googletest-${_gtest_abbrev}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_gtestsrc}.tar.gz::https://github.com/google/googletest/archive/${_gtest_abbrev}.tar.gz")
sha256sums=('09cde23ce2b02a59725b495107ab55058c47e4d532f3dedc47909f7133b6a8c6'
            'da0f704133e746bb248358ce05322ec9013c3c32449408e9235b4ebf23dbf6b6')

prepare() {
  cd "${srcdir}"
  tar -xf "${_gtestsrc}.tar.gz"
  mv "${_gtestsrc}"/* "${_pkgsrc}/lib/googletest"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
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
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
