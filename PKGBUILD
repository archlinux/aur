# Maintainer (since 5.1.8): Vladimir Yakovlev <desktop-app@protonmail.ch>
# Maintainer (before 5.1.8): Oirio Joshi <joshirio@protonmail.com>
# Author: Vladimir Yakovlev <desktop-app@protonmail.ch>

_binaryname=electron-mail
_electronversion=40

pkgname=electronmail-bin
pkgver=5.3.6
pkgrel=4
pkgdesc="Unofficial ProtonMail Desktop App"
arch=('x86_64')
url="https://github.com/vladimiry/ElectronMail"
license=('GPL3')
# add libappindicator-sharp to the depends array if you are fine with mono deps
depends=("electron${_electronversion}" 'c-ares' 'ffmpeg' 'gtk3' 'llhttp' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
optdepends=('org.freedesktop.secrets: password storage backend required for auto-login feature'
            'gnome-keyring: for storing passwords in GNOME Keyring')
conflicts=('electronmail')
provides=('electronmail')
install="${pkgname}.install"
source=("https://github.com/vladimiry/ElectronMail/releases/download/v${pkgver}/electron-mail-${pkgver}-linux-x64.pacman"
        "${pkgname}.install"
        "${pkgname}.sh"
        "LICENSE")
sha256sums=('7577977173316d9afcd38e0262d65a572e6fa2c85fffd9b8f096bcc8479fd588'
            '6c5090b4f3a53d2137592481c310ab889c10bc4a5790dae604c26a654f01c433'
            'aa18e228207e5c6a474fe46de191fceff349283d557174e57ccb451d1318851f'
            '1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68')
options=(!debug)

prepare() {
  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "${srcdir}/${pkgname}.sh"
  sed -i "s|^Exec[[:space:]]*=[[:space:]]*.*|Exec=${_binaryname} %U|" \
    "${srcdir}/usr/share/applications/electron-mail.desktop"
}

package() {
  cd "${srcdir}"

  install -Dm644 opt/ElectronMail/resources/app.asar \
    "${pkgdir}/opt/ElectronMail/resources/app.asar"

  cp -r opt/ElectronMail/resources/app.asar.unpacked \
    "${pkgdir}/opt/ElectronMail/resources/"

  for icon in usr/share/icons/hicolor/*/apps/*.png; do
    install -Dm644 "${icon}" "${pkgdir}/${icon}"
  done

  # legacy path for backward compatibility
  install -Dm755 "${pkgname}.sh" \
    "${pkgdir}/opt/ElectronMail/${_binaryname}"
  # new correct path in $PATH
  install -Dm755 "${pkgname}.sh" \
    "${pkgdir}/usr/bin/${_binaryname}"

  install -Dm644 usr/share/applications/electron-mail.desktop \
    "${pkgdir}/usr/share/applications/electron-mail.desktop"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
