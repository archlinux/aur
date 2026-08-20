# Maintainer: falser <zjf_0731 at 163 dot com>
pkgname=grok-bot-bin
pkgver=0.20.0
pkgrel=1
pkgdesc='Grok Bot desktop agent'
arch=('x86_64')
url='https://cursor.com'
license=('LicenseRef-Proprietary')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'hicolor-icon-theme' 'alsa-lib')
optdepends=('libappindicator-gtk3: tray support')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip' '!debug')
_commit=ca2c2b6f79b6130a4822d8189711b0f79f9d4661
source=("Grok_Bot_${pkgver}.deb::https://downloads.cursor.com/grokbot/stable/${_commit}/linux/x64/Grok_Bot_${pkgver}.deb")
sha256sums=('67a6eb6164ab233a5c5d4d50665efada2cbaae9f22efade85e934a65fdfbb20d')
noextract=("Grok_Bot_${pkgver}.deb")

package() {
    bsdtar -O -xf "Grok_Bot_${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    install -Dm644 "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/grok-bot.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/grok-bot.png"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/Grok Bot/grok-bot" "${pkgdir}/usr/bin/grok-bot"

    install -Dm644 "${pkgdir}/opt/Grok Bot/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"

    if ! { [[ -L /proc/self/ns/user ]] && unshare --user true; }; then
        chmod 4755 "${pkgdir}/opt/Grok Bot/chrome-sandbox"
    fi
}
