# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=snitch
pkgver=1.3.2
pkgrel=1
pkgdesc="Lightweight C++20 testing framework"
arch=("x86_64")
url="https://github.com/snitch-org/snitch"
license=("BSL-1.0")
depends=("gcc-libs")
makedepends=("cmake" "python")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snitch-org/snitch/archive/v${pkgver}.tar.gz")
b2sums=("5c34e81e26481983db76296236354be4807b4616554b596edcb40cdee1d0e0a933d2dbebe5ef9c78f4a792de83b494a7e29d458722cc18485858b4ad5ca3ac4c")

build() {
  cmake -B "build_shared/" -S "${pkgname}-${pkgver}" \
    -D BUILD_SHARED_LIBS:BOOL="ON" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev
  cmake -B "build_header_only/" -S "${pkgname}-${pkgver}" \
    -D SNITCH_HEADER_ONLY:BOOL="ON" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build_shared/"
  cmake --build "build_header_only/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build_shared/"
  DESTDIR="${pkgdir}" cmake --install "build_header_only/"

  rm -rf "${pkgdir}/usr/doc/" # BSL-1.0.txt is already installed
}
