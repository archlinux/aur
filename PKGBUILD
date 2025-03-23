# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="git-tui"
pkgver=1.2.0
pkgrel=2
pkgdesc="Collection of human friendly terminal interface for git"
arch=('x86_64')
url="https://github.com/ArthurSonzogni/${pkgname}"
license=('MIT')
depends=('gcc-libs' 'git' 'glibc')
makedepends=('cmake>=3.15' 'ftxui5' 'subprocess>=0.4')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('51fc9f55846fddb544f247e4154970c75d794a8523b240a914018eb59143bb91')

build() {
  export CXXFLAGS+=" -I/usr/include/ftxui5"
  export LDFLAGS+=" -L/usr/lib/ftxui5"
  local cmake_options=(
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Dftxui_DIR:PATH='/usr/lib/ftxui5/cmake/ftxui' \
    -Wno-dev
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
