# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=freeoffice
pkgver=1062
pkgrel=1
pkgdesc="A complete, reliable, lightning-fast and Microsoft Office-compatible office suite with a word processor, spreadsheet, and presentation graphics software."
arch=('x86_64')
url="http://www.freeoffice.com/"
license=('custom')
depends=('libxrandr' 'libgl' 'xdg-utils' 'gtk-update-icon-cache'
         'desktop-file-utils' 'curl')
makedepends=('chrpath')
install="${pkgname}.install"
source=("http://www.softmaker.net/down/softmaker-${pkgname}-2021-${pkgver}-amd64.tgz"
        "${pkgname}-textmaker"
        "${pkgname}-planmaker"
        "${pkgname}-presentations"
        "${pkgname}-textmaker.desktop"
        "${pkgname}-planmaker.desktop"
        "${pkgname}-presentations.desktop")
sha256sums=('0630bd1cf95ed0fc3a25cab61b62c3bb263fff3f1c7de9db1d7e466dc57de8ba'
            '0437328f3fddf93e18ad3df270971802c2e0fcaf3f030588c1301767a968da69'
            'c90e2575c71f03f0b627e4f6c70f437b9c40e5878bf9f553a4244b4a1f6dbd3c'
            'e6bc7608e58f44b55654c5d1fc93d442a400de638e2cbc6d5a3b3a8fbceaa0e4'
            '5068c61226553a04d7a9373e95fa77b0aac43b7abb45d17149464473162ebe47'
            '0b167897477e0914fcbafc40d188977daaff6df3ebda38f80feeab33c51d4e1e'
            '1c80fdb7cb4119cd08b892f033eb57a1b38bcc758f307c1621248009693f2f10')

prepare() {
  xz -d "freeoffice2021.tar.lzma"
}

build() {
  [ -d "${pkgname}" ] && rm -rf "${pkgname}"
  mkdir "${pkgname}"
  tar x -f "freeoffice2021.tar" -C "${pkgname}"
  # Remove insecure RPATH
  cd "${pkgname}"
  chrpath --delete "textmaker"
  chrpath --delete "planmaker"
  chrpath --delete "presentations"
}

package() {
  # Install package files
  install -d "${pkgdir}/usr/lib"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/lib"
  # Installing license file
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/${pkgname}/mime/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  # Install program executables
  install -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-planmaker"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-textmaker"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-presentations"
  # Installing icons
  for size in 16 32 48
  do
    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    ln -s "/usr/lib/${pkgname}/icons/pml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}-planmaker.png"
    ln -s "/usr/lib/${pkgname}/icons/prl_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}-presentations.png"
    ln -s "/usr/lib/${pkgname}/icons/tml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}-textmaker.png"

    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
    ln -s "/usr/lib/${pkgname}/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd.png"
    ln -s "/usr/lib/${pkgname}/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd.png"
    ln -s "/usr/lib/${pkgname}/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd.png"
  done
  # Install desktop files
  install -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}-textmaker.desktop"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}-planmaker.desktop"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}-presentations.desktop"
  # Installing mime file
  install -d "${pkgdir}/usr/share/mime/packages"
  install -m 644 -t "${pkgdir}/usr/share/mime/packages" "${srcdir}/${pkgname}/mime/softmaker-freeoffice21.xml"
}
