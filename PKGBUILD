# Maintainer: Adam 'TheElevatedOne' Mladý <admin@elevated.ovh> -> https://github.com/TheElevatedOne

pkgname=waycentral-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Centralized Program for Waybar Custom Modules (clock, updates, volume, music, network, tray, ...) with a C library"
arch=('x86_64')
url="https://github.com/TheElevatedOne/waycentral"
license=('GPL-3.0-or-later')
depends=('glibc' 'pacman' 'curl' 'json-c' 'libpulse' 'systemd-libs' 'gtk3')
provides=("waycentral=${pkgver}" 'libwaycentral.so')
conflicts=('waycentral')
source=("waycentral-${pkgver}.tar.gz::https://github.com/TheElevatedOne/waycentral/releases/download/${pkgver}/waycentral-${pkgver}.tar.gz")
sha256sums=('5d8b6392ac2fa750b63a26b2a63615c048fe23db3c3547efcd2ece3191fd2ef3')

package() {
  cd "${srcdir}"

  local major="${pkgver%%.*}"

  install -Dm755 waycentral "${pkgdir}/usr/bin/waycentral"
  install -Dm755 "libwaycentral.so.${pkgver}" "${pkgdir}/usr/lib/libwaycentral.so.${pkgver}"
  ln -s "libwaycentral.so.${pkgver}" "${pkgdir}/usr/lib/libwaycentral.so.${major}"
  ln -s "libwaycentral.so.${major}" "${pkgdir}/usr/lib/libwaycentral.so"
  install -Dm644 waycentral.h "${pkgdir}/usr/include/waycentral.h"
  install -Dm755 waycentral-tray.so "${pkgdir}/usr/lib/waycentral/waycentral-tray.so"

  install -dm755 "${pkgdir}/usr/lib/pkgconfig"
  cat > "${pkgdir}/usr/lib/pkgconfig/waycentral.pc" <<PC
prefix=/usr
libdir=/usr/lib
includedir=/usr/include

Name: waycentral
Description: Centralized Waybar modules as a C library
Version: ${pkgver}
Requires.private: libalpm libcurl json-c libsystemd libpulse
Libs: -L\${libdir} -lwaycentral
Cflags: -I\${includedir}
PC

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
