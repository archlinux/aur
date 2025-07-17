# Maintainer: Agustin Cisneros <agustincc@tutanota.com>

pkgname=ticktick
pkgver=6.0.40
pkgrel=1
pkgdesc='Official desktop application for Linux'
arch=('x86_64' 'aarch64')
url='https://ticktick.com/download'
license=('custom:Proprietary')
install=ticktick.install
conflicts=('ticktick-nativefier')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libatspi.so'
  'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
source=('ticktick.sh' 'LICENSE')
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::https://d2atcrkye2ik4e.cloudfront.net/download/linux/linux_deb_x64/${pkgname}-${pkgver}-amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb::https://d2atcrkye2ik4e.cloudfront.net/download/linux/linux_deb_arm64/${pkgname}-${pkgver}-arm64.deb")
sha256sums=('422ab230ea6a54ba9a44db25b1395d71bd52fc3add0cab13bbc95d86f769416e'
            '2d866fcb749c30d931fa96cc1578869b3fa9fc61a5c5f30e0316ddb00abb5814')
sha256sums_x86_64=('d1e06c0ffa8509a2bf22cbb85c956f7bef1306cb202c0b0208cd461cddb73c89')
sha256sums_aarch64=('5122a6c9d8b2798f0889b7be79b706726c28ed7244c3f1047ff398e0fb12ae5f')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"

  # Replace default path to system symlink
  sed -i "s|^Exec=.*|Exec=/usr/bin/${pkgname} --uri=%U|" "${pkgdir}/usr/share/applications/ticktick.desktop"

  # Copy launch script to allow custom flags
  install -Dm 755 ticktick.sh "${pkgdir}/usr/bin/ticktick"

  # Install license from https://ticktick.com/about/tos
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mv "${pkgdir}/opt/TickTick/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  mv "${pkgdir}/opt/TickTick/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  # SUID chrome-sandbox for Electron 5+
  chmod 4755 "${pkgdir}/opt/TickTick/chrome-sandbox"
}
