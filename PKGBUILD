# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=freeoffice
pkgver=755
pkgrel=1
pkgdesc="A complete, reliable, lightning-fast and Microsoft Office-compatible office suite with a word processor, spreadsheet, and presentation graphics software."
arch=(i686 x86_64)
url="http://www.freeoffice.com/"
license=('custom')
depends=('xdg-utils' 'shared-mime-info' 'gtk-update-icon-cache' 'desktop-file-utils')
depends_i686=('libxrender' 'libxrandr' 'libgl')
depends_x86_64=('lib32-gcc-libs' 'lib32-libxmu' 'lib32-libxrender' 'lib32-libxrandr' 'lib32-libgl')
install="${pkgname}.install"
source=("http://www.softmaker.net/down/softmaker-${pkgname}-${pkgver}.tgz"
        "${pkgname}-textmaker"
        "${pkgname}-planmaker"
        "${pkgname}-presentations"
        "${pkgname}-textmaker.desktop"
        "${pkgname}-planmaker.desktop"
        "${pkgname}-presentations.desktop")
sha256sums=('8a02aa49c175c132b35634bdeec0e072441d6d574d7705825d3629b62c451657'
            '0437328f3fddf93e18ad3df270971802c2e0fcaf3f030588c1301767a968da69'
            'c90e2575c71f03f0b627e4f6c70f437b9c40e5878bf9f553a4244b4a1f6dbd3c'
            'e6bc7608e58f44b55654c5d1fc93d442a400de638e2cbc6d5a3b3a8fbceaa0e4'
            '1554213ee9058a6594e2b92e47891ad58e593a4ea7d678c755cd32e263f43da8'
            '518913a4e3edb1f38dec65b865cf0687d5a4a5a1ecaa7fb5d653d5516a4d2ff8'
            '2b305734e63c5fba12def3c6ddfa79ef711f1c857fe68250b0d03d56df2bd980')

build() {
  [ -d "${pkgname}" ] && rm -rf "${pkgname}"
  mkdir "${pkgname}"
  tar xz -f freeoffice.tgz -C "${pkgname}"
}

package() {
  msg2 "Installing package files..."
  install -d "${pkgdir}/usr/lib"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/lib"
  msg2 "Installing license file..."
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  msg2 "Installing program executables..."
  install -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-planmaker"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-textmaker"
  install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-presentations"
  msg2 "Installing icons..."
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
  msg2 "Installing desktop files..."
  install -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}-textmaker.desktop"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}-planmaker.desktop"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}-presentations.desktop"
  msg2 "Installing mime file..."
  install -d "${pkgdir}/usr/share/mime/packages"
  install -m 644 -t "${pkgdir}/usr/share/mime/packages" "${srcdir}/${pkgname}/mime/softmaker-freeoffice.xml"
}
