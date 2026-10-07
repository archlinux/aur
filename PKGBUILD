# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=sudoforge
pkgver=1.0.1
pkgrel=1
pkgdesc="One password box for every admin request on the Sway desktop: polkit's admin pop-up and sudo -A, saying who is asking and what for (KognogOS, Forge Suite)"
arch=('any')
# sudoForge lives in the Forge Suite repository (D-60); releases are tagged sudoforge-vX.Y.Z there
_repo="https://github.com/jetomev/forge-suite"
url="${_repo}/tree/main/sudoforge"
license=('GPL3')
# forgekit 0.8.0: the centred password field and the box's layout (#34).
# python-gobject + polkit: the session's admin pop-up. alacritty: the box's window.
depends=('python' 'python-textual' 'python-forgekit>=0.8.0' 'python-gobject' 'polkit' 'sudo' 'alacritty')
optdepends=('sway: the desktop sudoForge is made for (the service checks it at start)')
install=sudoforge.install
source=("${pkgname}-${pkgver}.tar.gz::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('b09392a6440d02c13e3eb230227d093b0aed66461b6984a06e66cb82cced97f7'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # A stand-in sudo and a stand-in box, plus the real box headless: nothing
    # asks the builder's system for a password. The live polkit check is
    # skipped unless SUDOFORGE_LIVE_POLKIT=1.
    PYTHONDONTWRITEBYTECODE=1 python -m unittest discover -s tests -t .
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r sudoforge "${pkgdir}/usr/lib/${pkgname}/"
    install -m755 main.py "${pkgdir}/usr/lib/${pkgname}/main.py"
    # the helper /etc/sudo.conf names after `sudoforge setup` (D-3)
    install -m755 sudoforge-askpass "${pkgdir}/usr/lib/${pkgname}/sudoforge-askpass"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCH'
#!/bin/sh
exec python3 /usr/lib/sudoforge/main.py "$@"
LAUNCH
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
