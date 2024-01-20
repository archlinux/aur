# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=concurrentqueue
pkgdesc="A fast multi-producer, multi-consumer lock-free concurrent queue for C++11"
pkgver=1.0.4
pkgrel=2
arch=("any")
url="https://github.com/cameron314/concurrentqueue"
license=("(BSD-2-Clause AND Zlib) OR (BSL-1.0 AND Zlib)")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cameron314/concurrentqueue/archive/v${pkgver}.tar.gz")
b2sums=("8019a82e8cac2130e6565a07a153f17762673d1b1254e824ab0aadc9424836452ab89471513975cceb6f161a04480d58ea56679673c8459136d735d4df2de863")

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
