# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=concurrentqueue
pkgdesc="A fast multi-producer, multi-consumer lock-free concurrent queue for C++11"
pkgver=1.0.5
pkgrel=1
arch=("any")
url="https://github.com/cameron314/concurrentqueue"
license=("(BSD-2-Clause AND Zlib) OR (BSL-1.0 AND Zlib)")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cameron314/concurrentqueue/archive/v${pkgver}.tar.gz")
b2sums=("167b338638c133b10a365b0b70160b301eb19ab18eee4e7dadb2c4672d468a43996b296d0ed8066a4499904f71daa0f1deaa3ac8b3e345175de74960ef94cd89")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "${pkgname}-${pkgver}/LICENSE.md"
  awk "/Copyright/,/\/\/ 3\./" "${pkgname}-${pkgver}/lightweightsemaphore.h" \
    | sed "s/\/\/ \?//" \
    > "${pkgdir}/usr/share/licenses/${pkgname}/lightweightsemaphore-Zlib.txt"
}
