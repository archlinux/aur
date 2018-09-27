# Maintainer: Francisco Soto <ebobby(at)ebobby(dot)org>

_pkgname=system76-firmware
pkgname=system76-firmware-daemon
pkgver=1.0.2
pkgrel=2
pkgdesc="System76 Firmware Daemon provides a daemon for installing firmware updates."
arch=('any')
url="https://github.com/pop-os/system76-firmware"
license=('GPL')
install="${pkgname}.install"
depends=(
  'dbus'
  'systemd'
  'openssl-1.0'
)
makedepends=('rust')
conflicts=(
  'system76-driver<=17.10.32'
)
source=("https://github.com/pop-os/${_pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('be085cc346589158897cd9d38119e6d3cf2d2994')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  ###########
  # Install #
  ###########

  # Build and install base package
  OPENSSL_LIB_DIR="/usr/lib/openssl-1.0" OPENSSL_INCLUDE_DIR="/usr/include/openssl-1.0" cargo build --release
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # Install daemons
  install -m755 -D target/release/system76-firmware-daemon ${pkgdir}/usr/lib/${_pkgname}/system76-firmware-daemon

  # Install systemd unit files
  install -m644 -D debian/system76-firmware-daemon.service ${pkgdir}/usr/lib/systemd/system/system76-firmware-daemon.service

  # Install scripts and configuration
  install -m755 -D data/system76-firmware-daemon.conf ${pkgdir}/usr/share/dbus-1/system.d/system76-firmware-daemon.conf
}
