# Maintainer: Vincent Bernardoff <vb at luminar dot eu dot org>
# Co-Maintainer: das_kube
# Co-Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=aeron-git
pkgver=1.40.0.r226.g4e5374a06
pkgrel=1
pkgdesc="Efficient reliable UDP unicast, UDP multicast, and IPC message transport"
arch=('i686' 'x86_64')
url="https://github.com/real-logic/aeron"
license=('Apache')
depends=('gcc-libs' 'libbsd' 'util-linux-libs' 'zlib' 'java-environment')
makedepends=('cmake')
source=("git+https://github.com/real-logic/aeron.git"
        "aeronmd.service")
sha256sums=('SKIP'
            '3e6f3d61880ef39743c77103a169f53074337adbe382c78a768bd001d8a646be')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake \
    -DBUILD_SHARED_LIBS=on \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAERON_BUILD_DOCUMENTATION=off \
    -DAERON_TESTS=off \
    ../${pkgname%-git}

  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/aeronmd.service" "${pkgdir}/usr/lib/systemd/user/aeronmd.service"
}
