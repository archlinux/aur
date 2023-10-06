# Maintainer: Ilia Titov <mail@u236.org>
# Contributor: Sergey Moryakov <sergey@nqnet.org>

pkgname=homed-web
pkgver=1.1.1
pkgrel=1
pkgdesc="HOMEd Web is web interface for all HOMEd services, part of HOMEd project"
arch=("armv7h" "i686" "x86_64")
url="https://wiki.homed.dev/"
license=("GPL3")
backup=("etc/homed/homed-web.conf")
depends=("qt5-mqtt" "qt5-websockets")
makedepends=("qt5-tools")
source=(
  "https://github.com/u236/homed-service-web/archive/refs/tags/${pkgver}.tar.gz"
  "git+https://github.com/u236/homed-service-common.git"
)
sha512sums=(
  "da0ef31206519927ea70a40719b1ff1b1ee723e9ebbc943dc408b3192830799aa56ace4b85d05feef342685fbd924b7907204b484b0528b3fa186291b70b8d09"
  "SKIP"
)

prepare() {
  cd "${srcdir}/homed-service-common"
  sed -i "s/homed-common/homed-service-common/" homed-common.pri
  cd "${srcdir}/homed-service-web-${pkgver}"
  sed -i "s/homed-common/homed-service-common/" homed-web.pro
}

build() {
  cd "${srcdir}/homed-service-web-${pkgver}"
  qmake-qt5
  make -j $(nproc)
}

package() {
  cd "${srcdir}/homed-service-web-${pkgver}"
  make INSTALL_ROOT="${pkgdir}/" install
  install -Dm644 "deploy/systemd/homed-web.service" "${pkgdir}/etc/systemd/system/homed-web.service"
  install -Dm644 "deploy/data/etc/homed/homed-web.conf" "${pkgdir}/etc/homed/homed-web.conf"
}
