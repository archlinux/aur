# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="ftxui"
pkgver=5.0.0
pkgrel=2
pkgdesc="A C++ Functional Terminal User Interface"
arch=('any')
url="https://github.com/ArthurSonzogni/${pkgname}"
license=('MIT')
makedepends=('cmake>=3.12' 'gtest>=1.10.0' 'benchmark>=1.8.2')
_pkgsrc="FTXUI-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a2991cb222c944aee14397965d9f6b050245da849d8c5da7c72d112de2786b5b')

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DFTXUI_ENABLE_INSTALL=ON \
    -DFTXUI_BUILD_EXAMPLES=OFF \
    -DFTXUI_BUILD_TESTS=ON \
    -DFTXUI_BUILD_DOCS=OFF \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" --output-on-failure --stop-on-failure
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
