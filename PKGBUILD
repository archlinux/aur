# Maintainer: Adam 'TheElevatedOne' Mladý <admin@elevated.ovh> -> https://github.com/TheElevatedOne

pkgname=wayweather-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="Weather module for Waybar with saved locations, GPS/IP geolocation, a TUI and a C library"
arch=('x86_64')
url="https://github.com/TheElevatedOne/wayweather"
license=('GPL-3.0-or-later')
depends=('glibc' 'curl' 'cjson' 'ncurses' 'geoclue' 'glib2')
optdepends=('gpsd: GPS receiver support'
            'ttf-nerd-fonts-symbols: weather icons')
provides=("wayweather=${pkgver}" 'libwayweather.so')
conflicts=('wayweather' 'wayweather-git')
source=("wayweather-${pkgver}.tar.gz::https://github.com/TheElevatedOne/wayweather/releases/download/${pkgver}/wayweather-${pkgver}.tar.gz")
sha256sums=('7f5b3d3622742b7d7a3dbda92a815fa65bef28985852f9ebcbccebcb78d16af7')

package() {
  cd "${srcdir}"

  local major="${pkgver%%.*}"
  local doc="${pkgdir}/usr/share/doc/wayweather"

  install -Dm755 wayweather "${pkgdir}/usr/bin/wayweather"
  install -Dm755 "libwayweather.so.${pkgver}" "${pkgdir}/usr/lib/libwayweather.so.${pkgver}"
  ln -s "libwayweather.so.${pkgver}" "${pkgdir}/usr/lib/libwayweather.so.${major}"
  ln -s "libwayweather.so.${major}" "${pkgdir}/usr/lib/libwayweather.so"
  install -Dm644 libwayweather.a "${pkgdir}/usr/lib/libwayweather.a"
  install -Dm644 wayweather.h "${pkgdir}/usr/include/wayweather.h"

  install -dm755 "${pkgdir}/usr/lib/pkgconfig"
  cat > "${pkgdir}/usr/lib/pkgconfig/wayweather.pc" <<PC
prefix=/usr
libdir=/usr/lib
includedir=/usr/include

Name: wayweather
Description: Weather, place search and geolocation from wayweather
Version: ${pkgver}
Requires.private: libcurl libcjson libgeoclue-2.0
Libs: -L\${libdir} -lwayweather
Libs.private: -lm -pthread
Cflags: -I\${includedir}
PC

  install -Dm644 data/wayweather.1 "${pkgdir}/usr/share/man/man1/wayweather.1"
  install -Dm644 data/completions/wayweather.bash "${pkgdir}/usr/share/bash-completion/completions/wayweather"
  install -Dm644 data/completions/_wayweather "${pkgdir}/usr/share/zsh/site-functions/_wayweather"
  install -Dm644 data/completions/wayweather.fish "${pkgdir}/usr/share/fish/vendor_completions.d/wayweather.fish"
  install -Dm644 data/waybar/config.jsonc "${doc}/waybar/config.jsonc"
  install -Dm644 data/waybar/style.css "${doc}/waybar/style.css"
  install -Dm644 README.md "${doc}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
