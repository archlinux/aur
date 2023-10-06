# Maintainer: Ilia Titov <mail@u236.org>
# Contributor: Sergey Moryakov <sergey@nqnet.org>

pkgname=homed-web
pkgver=1.1.0
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
  "6da1babf82b94b9f7d84db4ff00b7f389eef4f0c93ca129b4ef79a273da884658209c45173e6f066e2805fcde97bd63892781fbde7dd5c19ac5713fcadfd34ae"
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
  mkdir -p ${pkgdir}/opt/homed-web
  install -Dm644 "deploy/systemd/homed-web.service" "${pkgdir}/etc/systemd/system/homed-web.service"
  install -Dm644 "deploy/data/etc/homed/homed-web.conf" "${pkgdir}/etc/homed/homed-web.conf"
}
