# Maintainer: Lucas Pape <development@lucaspape.de>

_npmname=monitoring.js
_npmver=1.2.4
pkgname=monitoring.js
pkgver=1.2.4
pkgrel=1
pkgdesc="Run commands on local/remote servers and send messages when they fail"
arch=('i686' 'x86_64')
install=${pkgname}.install
depends=('nodejs' 'openssh' 'pacman-contrib')
makedepends=('npm')
url="https://github.com/lucaspape/monitoring.js"
license=('GPL3')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/monitoring.js/-/monitoring.js-${pkgver}.tgz")
sha512sums=('SKIP')
NoUpgrade=(etc/monitoring.js/commands/*.json)

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}

  mkdir "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/etc/monitoring.js/hosts/"
  mkdir -p "${pkgdir}/etc/systemd/system/"

  cp "${srcdir}/package/scripts/monitoring.js" "${pkgdir}/usr/bin/"
  cp "${srcdir}/package/scripts/monitoring.js-setup" "${pkgdir}/usr/bin/"
  cp "${srcdir}/package/scripts/monitoring.js.service" "${pkgdir}/etc/systemd/system/"
  cp "${srcdir}/package/scripts/cpuload-per-core.sh" "${pkgdir}/usr/bin/cpuload-per-core"
  cp "${srcdir}/package/scripts/check-docker-compose.sh" "${pkgdir}/usr/bin/check-docker-compose"
  cp -r "${srcdir}/package/commands/" "${pkgdir}/etc/monitoring.js/commands/"

  chmod -R +x ${pkgdir}/usr/bin/
  chmod -R 755 ${pkgdir}/usr/lib/node_modules/

  install -Dm644 "${srcdir}/package/scripts/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
