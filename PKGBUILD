# Maintainer: falser <zjf_0731@163.com>
pkgname=grok-bot-bin
pkgver=0.30.0
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
    hicolor-icon-theme
    alsa-lib
    libappindicator
)
makedepends=('python')
provides=('sand')
conflicts=('sand' 'grok-bot-bin' 'grokbot-linux-port' 'grokbot-linux-port-bin')
options=('!strip' '!debug')
_commit=2385d097738b3719cc5ecd9281a107aa106215f1
source=(
    "grok-bot_${pkgver}_amd64.deb::https://downloads.cursor.com/grokbot/stable/${_commit}/linux/x64/grok-bot_${pkgver}_amd64.deb"
    grok-bot.sh
    linux-tray.cjs
    extract-asar.py
)
sha256sums=(
    'fb888b2204c8a51c71a9f5f9a2913ac10561f3ef6939c1245ecae4e837d4ada2'
    '9b3cccfada1dbe44ce794177181515aaf328603484327ef72a914234544bfbf8'
    '9ea1f1939677ec7364bc024ec4b87f8873ef41e6b1b5cec407d0a022ca3678f6'
    '183e572725d5b9ffe618a3fc00f32916feb21e38d59733bc98ce3bbcda147da1'
)
noextract=("grok-bot_${pkgver}_amd64.deb")

package() {
    bsdtar -O -xf "grok-bot_${pkgver}_amd64.deb" data.tar.xz \
        | bsdtar -C "${pkgdir}" -xJf -

    # Upstream never creates an Electron Tray. Unpack app.asar so we can
    # inject a StatusNotifierItem wrapper (Omarchy/Hyprland tray).
    local _res="${pkgdir}/opt/Grok Bot/resources"
    python "${srcdir}/extract-asar.py" "${_res}/app.asar" "${_res}/app"
    if [[ -d "${_res}/app.asar.unpacked" ]]; then
        cp -a "${_res}/app.asar.unpacked/." "${_res}/app/"
        rm -rf "${_res}/app.asar.unpacked"
    fi
    rm -f "${_res}/app.asar"
    install -Dm644 linux-tray.cjs "${_res}/app/dist/electron-main/linux-tray.cjs"
    python - "${_res}/app/package.json" <<'PY'
import json, pathlib, sys
path = pathlib.Path(sys.argv[1])
data = json.loads(path.read_text())
data["main"] = "dist/electron-main/linux-tray.cjs"
path.write_text(json.dumps(data, indent=2) + "\n")
PY

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
