# Maintainer: Ilia Titov <mail@u236.org>
# Contributor: Sergey Moryakov <sergey@nqnet.org>

pkgname=homed-zigbee
pkgver=3.5.5
pkgrel=1
pkgdesc="HOMEd ZigBee is a ZigBee to MQTT gateway"
arch=("armv7h" "i686" "x86_64")
url="https://wiki.homed.dev/"
license=("GPL3")
backup=("etc/homed/homed-zigbee.conf")
depends=("qt5-mqtt" "qt5-serialport")
makedepends=("qt5-tools")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/u236/homed-service-zigbee/archive/refs/tags/${pkgver}.tar.gz"
  "git+https://github.com/u236/homed-service-common.git"
)
sha512sums=(
  "67e73b9fcbfb2768dbcb9fccbc5fb75cac5f266b0134da6a9ffe8c154906028ca4d87108453cf3e8bea3ce049f5a5f0f907e9a4131fabba93530104efb060ddc"
  "SKIP"
)

prepare() {
  cd "${srcdir}/homed-service-common"
  sed -i "s/homed-common/homed-service-common/" homed-common.pri
  cd "${srcdir}/homed-service-zigbee-${pkgver}"
  sed -i "s/homed-common/homed-service-common/" homed-zigbee.pro
}

build() {
  cd "${srcdir}/homed-service-zigbee-${pkgver}"
  qmake-qt5
  make -j $(nproc)
}

package() {
  cd "${srcdir}/homed-service-zigbee-${pkgver}"
  make INSTALL_ROOT="${pkgdir}/" install
  mkdir -p ${pkgdir}/var/lib/${pkgname}
  install -Dm644 "deploy/systemd/${pkgname}.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"
  install -Dm644 "deploy/data/etc/homed/${pkgname}.conf" "${pkgdir}/etc/homed/${pkgname}.conf"
  sed -i "s%=/opt/%=/var/lib/%g" "${pkgdir}/etc/homed/${pkgname}.conf"
}
