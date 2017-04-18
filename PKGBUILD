# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=onlyoffice-desktopeditors-portable
pkgver=4.3.2.48
pkgrel=1
pkgdesc='Open-source office suite that combines text, spreadsheet and presentation editors.'
url="https://www.onlyoffice.com/"
license=('AGPL3')
arch=('x86_64')
depends=('desktop-file-utils' 'hicolor-icon-theme')
conflicts=('onlyoffice-bin')
provides=('onlyoffice-desktopeditors')
options=(!strip)
source=("${pkgname%-*}-${pkgver}-x64.tar.gz::http://download.onlyoffice.com/install/desktop/editors/linux/${pkgname%-*}-x64.tar.gz"
        "${pkgname%-*}.desktop")
noextract=("${pkgname%-*}-${pkgver}-x64.tar.gz")
sha256sums=('74ca44eb4196b5c28858de9d1c68b0b4f9883fc8dacd07c9348186cfbb7f9bee'
            '4d26e775fba828e7c39fcd088c76bc03dfbf82e53b122863b122905ab027fa66')

#PKGEXT=".pkg.tar"

package() {
  install -d -m0755 "${pkgdir}"/{opt/onlyoffice,usr/bin}
  bsdtar -zxvf ${pkgname%-*}-${pkgver}-x64.tar.gz -C "${pkgdir}"/opt/onlyoffice
  # suid sanbox
  chmod 4755 "$pkgdir/opt/onlyoffice/desktopeditors/chrome-sandbox"
  ln -s "/opt/onlyoffice/desktopeditors/${pkgname%-*}.sh" "${pkgdir}/usr/bin/${pkgname%-*}"
  install -Dm644 "${pkgname%-*}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-*}.desktop"
  for res in 16 24 32 48 64 128 256; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps"
    ln -s "/opt/onlyoffice/desktopeditors/asc-de-${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/asc-de.png"
  done
  install -Dm644 "${pkgdir}/opt/onlyoffice/desktopeditors/3DPARTYLICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/3DPARTYLICENSE"
}
