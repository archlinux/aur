# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=nightforge
pkgver=1.1.0
pkgrel=1
pkgdesc="The night light, your way: on or off, how warm, and when, with its own tray icon. For KognogOS's hypeForge desktop on Sway (wlroots); runs in any terminal, even a plain text console (Forge Suite)"
arch=('any')
# nightForge lives in the Forge Suite repository (D-60); releases are tagged nightforge-vX.Y.Z there
_repo="https://github.com/jetomev/forge-suite"
url="${_repo}/tree/main/nightforge"
license=('GPL3')
# wlsunset: the night light itself. python-gobject: the tray icon (D-Bus through Gio).
# python-rich and glib2 (Gio): used directly (the 2026-10-11 dependency audit, forge-suite#91)
depends=('python' 'python-textual' 'python-rich' 'python-forgekit>=0.10.0' 'python-gobject' 'glib2' 'wlsunset')
optdepends=('sway: the desktop it is made for, with hypeForge (runs nightforge start at login)'
            'alacritty: the tray menu'"'"'s Open nightForge'
            'libnotify: a message when the night light cannot start')
checkdepends=('dbus')
source=("${pkgname}-${pkgver}.tar.gz::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('dd63c75bde0d769af28a3093f8cb8d8f9f6f13d097d227e4345be0bd2fea5b81'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # a stand-in night light (tests/fake-wlsunset), the tray on a private bus: no screen is touched
    PYTHONDONTWRITEBYTECODE=1 python -m unittest discover -s tests -t .
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r nightforge "${pkgdir}/usr/lib/${pkgname}/"
    install -m755 main.py "${pkgdir}/usr/lib/${pkgname}/main.py"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCH'
#!/bin/sh
exec python3 /usr/lib/nightforge/main.py "$@"
LAUNCH
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 docs/CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
