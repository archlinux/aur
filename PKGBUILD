# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=displayforge
pkgver=1.1.0
pkgrel=1
pkgdesc="Screen settings in the terminal: arrange, resolution, refresh rate, size, rotation, brightness, with a countdown that undoes a change by itself. Sway desktop only, written for KognogOS; on a plain text console it explains why and closes (Forge Suite)"
arch=('any')
# displayForge lives in the Forge Suite repository (D-60); releases are tagged displayforge-vX.Y.Z there
_repo="https://github.com/jetomev/forge-suite"
url="${_repo}/tree/main/displayforge"
license=('GPL3')
# forgekit 0.10.0: the menu's keys, --hypeforge (hypeForge Settings' Screens page), the start-up check.
# sway: displayForge sets up screens through Sway and nothing else (it checks at start).
depends=('python' 'python-textual' 'python-forgekit>=0.10.0' 'sway')
optdepends=('ddcutil: Brightness and Identify (your screens need DDC/CI switched on in their own menu)')
source=("${pkgname}-${pkgver}.tar.gz::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('88c61439dc727b67580eb08745c30e71ec3d4e34dd2ff5322bd99f25236dc3da'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # headless, on Javier's three screens as recorded data, with a stand-in swaymsg: no real screen is touched
    PYTHONDONTWRITEBYTECODE=1 python -m unittest discover -s tests -t .
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r displayforge "${pkgdir}/usr/lib/${pkgname}/"
    install -m755 main.py "${pkgdir}/usr/lib/${pkgname}/main.py"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCH'
#!/bin/sh
exec python3 /usr/lib/displayforge/main.py "$@"
LAUNCH
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 docs/CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    # GPL3 is one of Arch's common licenses (/usr/share/licenses/common/GPL3): no copy needed
}
