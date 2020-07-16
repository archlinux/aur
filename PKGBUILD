# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sparrow-wifi-git
pkgver=r147.a97885f
pkgrel=1
pkgdesc='Next-Gen GUI-based WiFi and Bluetooth Analyzer for Linux'
arch=('any')
url="https://github.com/ghostop14/sparrow-wifi"
license=('GPL3')
provides=('sparrow-wifi')
depends=('gpsd'
         'tk'
         'python-matplotlib'
         'python-qscintilla-qt5'
         'python-pyqt5'
         'python-manuf'
         'python-numpy'
         'python-dateutil'
         'python-sip'
         'python-pyqtchart'
         'python-gps3')
makedepends=('git' 'gendesk')
source=("${pkgname%-git}::git+https://github.com/ghostop14/sparrow-wifi")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -d "${pkgdir}/opt/"
  install -Dm644 "docs/Spectral Fusion Sparrow Wifi.pdf" -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
  install -Dm644 wifi_icon.png "${pkgdir}/usr/share/pixmaps/sparrow-wifi.png"
  rm telemetry-screenshot.png \
     spectrum-screenshot.png \
     sparrow-screenshot.png \
     LICENSE \
     README.md \
     rpi.setup_prerequisites.sh
  rm -rf docs .git
  cd "${srcdir}"
  cp -avR sparrow-wifi "${pkgdir}/opt/"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/sparrow-wifi/sparrow-wifi.py "${pkgdir}/usr/bin/sparrow-wifi"
  gendesk -f -n --pkgname "${pkgname%-git}" \
          --pkgdesc "$pkgdesc" \
          --name "Sparrow WiFi" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-git}" \
          --categories 'Network;Application' \
          --icon "${pkgname%-git}"
  install -Dm644 "${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}