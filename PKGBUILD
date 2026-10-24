# Maintainer: Adam 'TheElevatedOne' Mladý <admin@elevated.ovh> -> https://github.com/TheElevatedOne

pkgname=waycentral-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Centralized Program for Waybar Custom Modules (clock, updates, volume, music, network, GPU, tray, ...) with a C library"
arch=('x86_64')
url="https://github.com/TheElevatedOne/waycentral"
license=('GPL-3.0-or-later')
depends=('glibc' 'pacman' 'curl' 'json-c' 'libpulse' 'systemd-libs' 'gtk3')
optdepends=('hwdata: GPU names' 'nvidia-utils: NVIDIA GPU statistics')
provides=("waycentral=${pkgver}" 'libwaycentral.so')
conflicts=('waycentral')
source=("waycentral-${pkgver}.tar.gz::https://github.com/TheElevatedOne/waycentral/releases/download/${pkgver}/waycentral-${pkgver}.tar.gz")
sha256sums=('f935dcb16839798a0d909125d9b3f040f4611a924427af5a0f809a52bcd1237b')

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
