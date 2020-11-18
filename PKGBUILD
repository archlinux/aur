# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lines
pkgver=5.0
pkgrel=1
pkgdesc='A modern and minimalist text editor - IDE with support for over 150 programming languages'
arch=('x86_64')
url="https://www.creatixbih.com/lines"
license=('custom')
provides=('lines-code-editor')
depends=('gtk3'
         'libxss'
         'nss')
options=('strip')
makedepends=('unzip' 'gendesk')
source=("${pkgname}-${pkgver}.zip::https://www.creatixbih.com/dl/files/lines_linux_x64.zip")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('157a8c592941f749ef5030cb49dd2ec944d9b42785d0dccfe2dd3025b403dcee')

package() {
  mkdir -p "${pkgdir}/opt"
  unzip "${srcdir}/${pkgname}-${pkgver}.zip" -d "${pkgdir}/opt/"
  cd "${pkgdir}/opt/"
  mv APP/Lines Lines
  rm -rf APP
  cd "${srcdir}"
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
