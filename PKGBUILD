# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=freeoffice
pkgver=944
pkgrel=1
pkgdesc="A complete, reliable, lightning-fast and Microsoft Office-compatible office suite with a word processor, spreadsheet, and presentation graphics software."
arch=('x86_64')
url="http://www.freeoffice.com/"
license=('custom')
depends=('libxrandr' 'libgl' 'xdg-utils' 'gtk-update-icon-cache'
         'desktop-file-utils' 'curl')
makedepends=('chrpath')
install="${pkgname}.install"
source=("http://www.softmaker.net/down/softmaker-${pkgname}-${pkgver}-amd64.tgz"
        "${pkgname}-textmaker"
        "${pkgname}-planmaker"
        "${pkgname}-presentations"
        "${pkgname}-textmaker.desktop"
        "${pkgname}-planmaker.desktop"
        "${pkgname}-presentations.desktop")
sha256sums=('6838233c9e965ad879581befc27b54f25de989b8df98b274de43eadbba2f9349'
            '0437328f3fddf93e18ad3df270971802c2e0fcaf3f030588c1301767a968da69'
            'c90e2575c71f03f0b627e4f6c70f437b9c40e5878bf9f553a4244b4a1f6dbd3c'
            'e6bc7608e58f44b55654c5d1fc93d442a400de638e2cbc6d5a3b3a8fbceaa0e4'
            '1554213ee9058a6594e2b92e47891ad58e593a4ea7d678c755cd32e263f43da8'
            '518913a4e3edb1f38dec65b865cf0687d5a4a5a1ecaa7fb5d653d5516a4d2ff8'
            '2b305734e63c5fba12def3c6ddfa79ef711f1c857fe68250b0d03d56df2bd980')

prepare() {
  xz -d "freeoffice2018.tar.lzma"
}

build() {
  [ -d "${pkgname}" ] && rm -rf "${pkgname}"
  mkdir "${pkgname}"
  tar x -f "freeoffice2018.tar" -C "${pkgname}"
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
  install -m 644 -t "${pkgdir}/usr/share/mime/packages" "${srcdir}/${pkgname}/mime/softmaker-freeoffice18.xml"
}
