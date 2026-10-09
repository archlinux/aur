# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=workspaceforge
pkgver=1.0.0
pkgrel=1
pkgdesc="Your workspaces in the terminal: names, order and the apps that open on each. For KognogOS's hypeForge desktop on Sway; runs in any terminal, even a plain text console (Forge Suite)"
arch=('any')
# workspaceForge lives in the Forge Suite repository (D-60); releases are tagged workspaceforge-vX.Y.Z there
_repo="https://github.com/jetomev/forge-suite"
url="${_repo}/tree/main/workspaceforge"
license=('GPL3')
# forgekit 0.10.0: the menu's keys and --hypeforge (hypeForge Settings' Workspaces page).
depends=('python' 'python-textual' 'python-forgekit>=0.10.0')
optdepends=('sway: the desktop it is made for, with hypeForge (open windows follow their workspace when you save)')
source=("${pkgname}-${pkgver}.tar.gz::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('fcea990887f3672a4233fccc186496ce5401afbe00dca531e847dcf0c734217c'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # headless (Textual's Pilot) on throwaway settings; nothing of the builder's desktop is read or moved
    PYTHONDONTWRITEBYTECODE=1 python -m unittest discover -s tests -t .
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r workspaceforge "${pkgdir}/usr/lib/${pkgname}/"
    install -m755 main.py "${pkgdir}/usr/lib/${pkgname}/main.py"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCH'
#!/bin/sh
exec python3 /usr/lib/workspaceforge/main.py "$@"
LAUNCH
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 docs/CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
