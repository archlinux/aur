# Maintainer: Barakah Alrashedi <barakah@unixv.com>
#
# Official Cursor Linux build of Grok Bot, repackaged for Arch.
# The package name matches this directory so the tree can be pushed to the AUR.
#
# Bump pkgver, _commit, and the .deb checksum together, then commit that
# version on its own. The linux-x64 update feed carries the release commit:
#   https://api2.cursor.sh/updates/api/update/linux-x64/sand/0.0.0/00000000-0000-0000-0000-000000000000/stable
#   https://downloads.cursor.com/grokbot/stable/<commit>/linux/x64/grok-bot_<version>_amd64.deb

pkgname=grok-bot-cursor
pkgver=0.68.1
pkgrel=2
pkgdesc='Grok Bot desktop agent'
arch=('x86_64')
url='https://cursor.com'
license=('LicenseRef-Proprietary')
depends=(
    gtk3
    libnotify
    nss
    libxss
    libxtst
    xdg-utils
    at-spi2-core
    util-linux-libs
    libsecret
    alsa-lib
    mesa
    libxkbcommon
    libdrm
    hicolor-icon-theme
)
optdepends=(
    'apparmor: load the shipped userns profile'
    'libappindicator: system tray icon'
)
provides=('grok-bot' 'sand')
conflicts=('grok-bot' 'grok-bot-bin' 'sand' 'grokbot-linux-port' 'grokbot-linux-port-bin')
replaces=('grok-bot' 'grok-bot-bin')
options=('!strip' '!debug')
_commit=33103062f95061ccf9c81c5b365d37ab152c3b66
source=(
    "grok-bot_${pkgver}_amd64.deb::https://downloads.cursor.com/grokbot/stable/${_commit}/linux/x64/grok-bot_${pkgver}_amd64.deb"
    grok-bot.sh
)
sha256sums=(
    'b2be8106d2b3eae07d983d5f1ca77b657accde666dc440db2a409421ecff3359'
    '9b3cccfada1dbe44ce794177181515aaf328603484327ef72a914234544bfbf8'
)
noextract=("grok-bot_${pkgver}_amd64.deb")

package() {
    bsdtar -O -xf "grok-bot_${pkgver}_amd64.deb" data.tar.xz \
        | bsdtar -C "${pkgdir}" -xJf -

    # electron-builder ships an unconfined userns profile. Debian postinst
    # copies it to /etc/apparmor.d; pacman never runs that script.
    install -Dm644 "${pkgdir}/opt/Grok Bot/resources/apparmor-profile" \
        "${pkgdir}/etc/apparmor.d/grok-bot"

    # Debian postinst uses update-alternatives; pacman never runs it.
    install -Dm755 grok-bot.sh "${pkgdir}/usr/bin/grok-bot"
    ln -s grok-bot "${pkgdir}/usr/bin/sand"

    sed -i 's|^Exec=.*|Exec=grok-bot %U|' \
        "${pkgdir}/usr/share/applications/grok-bot.desktop"

    install -Dm644 "${pkgdir}/opt/Grok Bot/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -Dm644 "${pkgdir}/opt/Grok Bot/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

    rm -rf "${pkgdir}/usr/share/doc"

    # SUID chrome-sandbox is only needed when user namespaces are unavailable
    # (for example linux-hardened). Stock Arch kernels already provide them.
    if ! { [[ -L /proc/self/ns/user ]] && unshare --user true; }; then
        chmod 4755 "${pkgdir}/opt/Grok Bot/chrome-sandbox"
    fi
}
