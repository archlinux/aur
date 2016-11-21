# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=onlyoffice-desktopeditors-portable
pkgver=4.1.2
pkgrel=33
pkgdesc='Open-source office suite that combines text, spreadsheet and presentation editors.'
url="https://www.onlyoffice.com/"
license=('AGPL3')
arch=('x86_64')
depends=('desktop-file-utils' 'hicolor-icon-theme')
conflicts=('onlyoffice-bin')
provides=('onlyoffice-desktopeditors')
options=(!strip)
source=("http://download.onlyoffice.com/install/desktop/editors/linux/${pkgname%-*}-${pkgver}-${pkgrel}-x64.tar.gz"
        "${pkgname%-*}.desktop")
noextract=("${pkgname%-*}-${pkgver}-${pkgrel}-x64.tar.gz")
sha256sums=('ecfb80a9077433c4608268ef6b6bcfcb8f6401c8f503a335f70cac5cf73933d3'
            '831832357168cc494c75f40a7cee8eddb92ddb204100a635fbeab31e27f07a44')

#PKGEXT=".pkg.tar"

package() {
  install -d -m0755 "${pkgdir}"/{opt/onlyoffice,usr/bin}
  tar -zxvf ${pkgname%-*}-${pkgver}-${pkgrel}-x64.tar.gz -C "${pkgdir}"/opt/onlyoffice
  rm -rf "${pkgdir}/opt/onlyoffice/desktopeditors/dictionaries/.git"
  # suid sanbox
  chmod 4755 "$pkgdir/opt/onlyoffice/desktopeditors/chrome-sandbox"
  ln -s "/opt/onlyoffice/desktopeditors/${pkgname%-*}.sh" "${pkgdir}/usr/bin/${pkgname%-*}"
  install -Dm644 "${pkgname%-*}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-*}.desktop"
  for res in 16 24 32 48 64 128 256; do
  install -Dm644 "${pkgdir}/opt/onlyoffice/desktopeditors/asc-de-${res}.png" \
    "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/asc-de.png"
  done
  install -Dm644 "${pkgdir}/opt/onlyoffice/desktopeditors/LICENSE.htm" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/opt/onlyoffice/desktopeditors/3DPARTYLICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/3DPARTYLICENSE"
}
