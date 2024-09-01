# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="ftxui"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=5.0.0
pkgrel=3
pkgdesc="A C++ Functional Terminal User Interface"
arch=('any')
url="https://github.com/ArthurSonzogni/${pkgbase}"
license=('MIT')
makedepends=('benchmark>=1.8.2' 'cmake>=3.12' 'doxygen' 'graphviz' 'gtest>=1.10')
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
    -DFTXUI_BUILD_DOCS=ON \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
  cmake --build "${_pkgsrc}/build" --target doc
}

check() {
  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" --output-on-failure --stop-on-failure
}

package_ftxui() {
  arch=('x86_64')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_ftxui-docs() {
  pkgdesc="HTML documentation for ${pkgbase}"

  cd "${srcdir}/${_pkgsrc}/build/doc/doxygen/html"
  install -d "${pkgdir}/usr/share/doc/${pkgbase}/doxygen"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgbase}/doxygen/{}" \;
}
