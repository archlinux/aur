# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=nogforge
pkgver=1.6.0
pkgrel=1
pkgdesc="Packages the KognogOS way, in a terminal, on top of nog: installed apps, search, install, readable updates and clean-up for repositories, AUR, Flatpak and Snap. Arch Linux / KognogOS, any desktop or none, works on a text console"
arch=('any')
# nogForge lives in the Forge Suite repository since 2026-10-22 (D-60); releases are tagged nogforge-vX.Y.Z there
_repo="https://github.com/jetomev/forge-suite"
url="${_repo}/tree/main/nogforge"
license=('GPL3')
# nog 2.0.0: the every-source rows (`list`, `search --json`) and the maintenance
# report (`clean --json`) nogForge reads since 1.5.0. forgekit 0.10.0: the menu's keys,
# the run window. Both are on the AUR first: dependency order.
depends=('python' 'python-textual' 'python-rich' 'python-forgekit>=0.10.0' 'nog>=2.0.0')
# 1.5.0 (#16): the launcher entry is validated in check()
checkdepends=('desktop-file-utils')
# v1.1.0: nog runs inside nogForge and the password is asked in its own box:
# no desktop password window needed (forgekit 0.6.0); nog 1.7.0 reports its steps
optdepends=('archlinux-appstream-data: app names and category badges'
            'flatpak: the Flatpak pages (shown only when it is installed)'
            'snapd: the Snap pages (shown only when it is installed)')
source=("${pkgname}-${pkgver}.tar.gz::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('66008380e54d005a5ac1bef119bb297d573ab0196f228a41b1b3077e0625f61d'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Every screen and flow headless, against a stand-in nog that prints nog's
    # JSON: no test installs, removes or updates anything, and none needs the
    # builder's own nog. PYTHONDONTWRITEBYTECODE=1 keeps .pyc caches out of
    # the source tree, so package() can't bundle them (the grubForge v1.0.2
    # install-conflict class).
    PYTHONDONTWRITEBYTECODE=1 python -m unittest discover tests
    desktop-file-validate nogforge.desktop
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    find nogforge -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r nogforge "${pkgdir}/usr/lib/${pkgname}/"
    cp main.py "${pkgdir}/usr/lib/${pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCH'
#!/bin/sh
exec python /usr/lib/nogforge/main.py "$@"
LAUNCH
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 nogforge.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    install -Dm644 nogforge.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
