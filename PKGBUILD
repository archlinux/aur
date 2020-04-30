# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lines
pkgver=4.3
pkgrel=1
pkgdesc='Lines is a modern and minimalist text editor - IDE with support for over 150 programming languages'
arch=('x86_64')
url="https://www.creatixbih.com/lines"
license=('custom')
provides=('lines-code-editor')
makedepends=('unzip' 'gendesk')
source=("${pkgname}-${pkgver}.zip::https://www.creatixbih.com/dl/files/lines_linux_x64.zip")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('9f1a2808aa903a70fbde83e05d57ea1da414c567dca8f3f50225dc0c428bf4a2')

package() {
  mkdir -p "${pkgdir}/opt"
  unzip "${srcdir}/${pkgname}-${pkgver}.zip" -d "${pkgdir}/opt/"
  install -Dm644 "${pkgdir}/opt/Lines/app/res/lines.png" \
   "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  mkdir -p "${pkgdir}/usr/bin"
  install -Dm644 "${pkgdir}/opt/Lines/app/license.txt" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s /opt/Lines/lines "${pkgdir}/usr/bin/lines"
  # Create desktop file
  gendesk -f -n --pkgname "${pkgname}" \
  	      --pkgdesc "${pkgdesc}" \
          --name "Lines" \
          --genericname "Lines Code Editor" \
          --comment "${pkgdesc}" \
          --exec "${pkgname}" \
          --categories 'Utility;Development;IDE;'
  install -Dm644 lines.desktop -t "${pkgdir}/usr/share/applications"
  cd "${pkgdir}/opt/Lines"
  chown root:root -R ./app/* 
  find . -type f -exec chmod 644 {} +
  find ./lib -type f | xargs chmod 644
  find . -type d | xargs chmod 775
  find . -type d | xargs chmod +s
  umask 0002
  chmod 755 ./lines
}
# vim:set ts=2 sw=2 et: