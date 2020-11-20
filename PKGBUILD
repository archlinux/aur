# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=universal-data-tool-bin
pkgver=0.14.9
pkgrel=1
pkgdesc="Collaborate & label any type of data, images, text, or documents, in an easy web interface or desktop app"
arch=('x86_64')
url='https://universaldatatool.com'
license=('MIT')
provides=('universal-data-tool')
options=('!strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::https://github.com/UniversalDataTool/universal-data-tool/releases/download/v${pkgver}/Universal-Data-Tool-${pkgver}.AppImage"
        'LICENSE::https://github.com/UniversalDataTool/universal-data-tool/raw/master/LICENSE')
sha256sums=('1e0a52d6aca50673a0c6e12e0fe8cc05a9c18865d5d96747a4057c8a762df05a'
            '7c65062117526f7cec40896a71b8dfab96da54194f61b18b95816920839da172')

package() {
  chmod 755 ./${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/universal-data-tool.png "${pkgdir}/usr/share/pixmaps/universal-data-tool.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Universal Data Tool" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Development;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
  ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
  find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
