# Maintainer: falser <zjf_0731@163.com>
pkgname=grok-bot-bin
pkgver=0.36.0
pkgrel=1
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
    hicolor-icon-theme
    alsa-lib
    libappindicator
)
makedepends=('python')
optdepends=('apparmor: load the shipped userns profile')
provides=('sand' 'grok-bot')
conflicts=('sand' 'grok-bot' 'grokbot-linux-port' 'grokbot-linux-port-bin')
replaces=('grok-bot')
options=('!strip' '!debug')
_commit=9465f3ae75550511296fabbb7a4b6fc8afe9e408
source=(
    "grok-bot_${pkgver}_amd64.deb::https://downloads.cursor.com/grokbot/stable/${_commit}/linux/x64/grok-bot_${pkgver}_amd64.deb"
    grok-bot.sh
    linux-tray.cjs
    extract-asar.py
)
sha256sums=(
    '948b4177667d9a03915c1aee497e7c5438705393da8083a6af0177288512d07e'
    '9b3cccfada1dbe44ce794177181515aaf328603484327ef72a914234544bfbf8'
    '9ea1f1939677ec7364bc024ec4b87f8873ef41e6b1b5cec407d0a022ca3678f6'
    '86e6a9d2ce60f974c002a0187fdca7f111744ff4a1187dc70ba415fe6c715942'
)
noextract=("grok-bot_${pkgver}_amd64.deb")

package() {
    bsdtar -O -xf "grok-bot_${pkgver}_amd64.deb" data.tar.xz \
        | bsdtar -C "${pkgdir}" -xJf -

    # Keep app.asar packed. Unpacking makes the renderer load Vite chunks
    # over file://, which Chromium rejects as failed dynamic imports.
    # Inject a StatusNotifierItem wrapper (Omarchy/Hyprland tray) into the asar.
    local _res="${pkgdir}/opt/Grok Bot/resources"
    python "${srcdir}/extract-asar.py" inject-tray \
        "${_res}/app.asar" "${_res}/app.asar.unpacked" \
        "${srcdir}/linux-tray.cjs"

    # electron-builder now ships an unconfined userns profile. Debian
    # postinst copies it to /etc/apparmor.d; pacman never runs that.
    install -Dm644 "${_res}/apparmor-profile" \
        "${pkgdir}/etc/apparmor.d/${pkgname%-bin}"

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
    # (e.g. linux-hardened). Stock Arch kernels already provide them.
    if ! { [[ -L /proc/self/ns/user ]] && unshare --user true; }; then
        chmod 4755 "${pkgdir}/opt/Grok Bot/chrome-sandbox"
    fi
}
