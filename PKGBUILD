# Maintainer: Ilia Titov <mail@u236.org>
# Contributor: Sergey Moryakov <sergey@nqnet.org>

pkgname=homed-automation
pkgver=1.2.5
pkgrel=1
pkgdesc="HOMEd Automation is simple service for home automations"
arch=("armv7h" "i686" "x86_64")
url="https://wiki.homed.dev/"
license=("GPL3")
backup=("etc/homed/homed-automation.conf")
depends=("curl" "qt5-mqtt")
makedepends=("qt5-tools")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/u236/homed-service-automation/archive/refs/tags/${pkgver}.tar.gz"
  "git+https://github.com/u236/homed-service-common.git"
)
sha512sums=(
  "6d7d0bd6902d1ea3e651df7e63dbc98a0599e8e14cf768987e0ed144b4027b54d7fdffb2cf121c15fefa11ed8bfdaafba4fa033c9e29e4410f63a618714b9b1c"
  "SKIP"
)

prepare() {
  cd "${srcdir}/homed-service-common"
  sed -i "s/homed-common/homed-service-common/" homed-common.pri
  cd "${srcdir}/homed-service-automation-${pkgver}"
  sed -i "s/homed-common/homed-service-common/" homed-automation.pro
}

build() {
  cd "${srcdir}/homed-service-automation-${pkgver}"
  qmake-qt5
  make -j $(nproc)
}

package() {
  cd "${srcdir}/homed-service-automation-${pkgver}"
  make INSTALL_ROOT="${pkgdir}/" install
  mkdir -p ${pkgdir}/var/lib/${pkgname}
  install -Dm644 "deploy/systemd/${pkgname}.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"
  install -Dm644 "deploy/data/etc/homed/${pkgname}.conf" "${pkgdir}/etc/homed/${pkgname}.conf"
  sed -i "s%=/opt/%=/var/lib/%g" "${pkgdir}/etc/homed/${pkgname}.conf"
}
