# Maintainer: falser <zjf_0731 at 163 dot com>
pkgname=grok-bot-bin
pkgver=0.29.0
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
_commit=f0e5bfcee649ea84c0c61369cf896cd146d72136
source=(
    "Grok_Bot_${pkgver}.deb::https://downloads.cursor.com/grokbot/stable/${_commit}/linux/x64/Grok_Bot_${pkgver}.deb"
    "grok-bot.sh"
)
sha256sums=(
    'd223b5830282aef11d5c46d8f4d1edd239bf992e336405cbd288d4476b9233d4'
    '9b3cccfada1dbe44ce794177181515aaf328603484327ef72a914234544bfbf8'
)
noextract=("Grok_Bot_${pkgver}.deb")

package() {
    bsdtar -O -xf "Grok_Bot_${pkgver}.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    install -Dm755 "${srcdir}/grok-bot.sh" "${pkgdir}/usr/bin/grok-bot"
    sed -i 's|^Exec=.*|Exec=grok-bot %U|' "${pkgdir}/usr/share/applications/grok-bot.desktop"

    install -Dm644 "${pkgdir}/opt/Grok Bot/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"

    if ! { [[ -L /proc/self/ns/user ]] && unshare --user true; }; then
        chmod 4755 "${pkgdir}/opt/Grok Bot/chrome-sandbox"
    fi
}
