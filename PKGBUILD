# Maintainer: Vincent Bernardoff <vb at luminar dot eu dot org>
# Co-Maintainer: das_kube
# Co-Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=aeron
pkgver=1.47.4
pkgrel=1
pkgdesc="Efficient reliable UDP unicast, UDP multicast, and IPC message transport"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/real-logic/aeron"
license=('Apache')
depends=('gcc-libs' 'libbsd' 'util-linux-libs' 'zlib')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/real-logic/aeron/archive/${pkgver}.tar.gz"
        "aeronmd.service")
sha256sums=('8fc0b8a760147944e3fd6432d7ff45defebecdfd84008ee8cc6066c7661cec52'
            '3e6f3d61880ef39743c77103a169f53074337adbe382c78a768bd001d8a646be')

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake \
    -DBUILD_SHARED_LIBS=on \
    -DBUILD_AERON_ARCHIVE_API=off \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAERON_BUILD_DOCUMENTATION=off \
    -DAERON_TESTS=off \
    ../${pkgname}-${pkgver}

  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/aeronmd.service" "${pkgdir}/usr/lib/systemd/user/aeronmd.service"
}
