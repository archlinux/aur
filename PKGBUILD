# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=defaultappsforge
pkgver=1.0.0
pkgrel=1
pkgdesc="Which app opens what: links, email, calendar, pictures, music, video, PDFs, files and more; web apps (Gmail, Google Calendar) as choices. Any Linux, any desktop or none, works on a text console (Forge Suite)"
arch=('any')
# defaultappsForge lives in the Forge Suite repository (D-60); releases are tagged defaultappsforge-vX.Y.Z there
_repo="https://github.com/jetomev/forge-suite"
url="${_repo}/tree/main/defaultappsforge"
license=('GPL3')
# from docs/PACKAGING.md (measured from the code; tests/test_needs.py fails on an unlisted import).
# nog: installing a missing terminal standard on save, and Find more… (nogForge, through nog)
depends=('python' 'python-textual' 'python-rich' 'python-forgekit>=0.10.0' 'nog')
optdepends=('xdg-utils: the system'"'"'s guess for each job, and the default browser for web apps'
            'xdg-terminal-exec: the default terminal entry'
            'nogforge: Find more… opens it already searching'
            'alacritty: Find more… opens nogForge in it')
checkdepends=('desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('a2f1273b7a143fce6db5df58b018a5b56f50cb5148157c99303fb8439289bb4f'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # every test works on a copy of the settings file: none touches the builder's choices
    PYTHONDONTWRITEBYTECODE=1 python -m unittest discover -s tests -t .
    desktop-file-validate defaultappsforge.desktop
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r defaultappsforge "${pkgdir}/usr/lib/${pkgname}/"
    install -m755 main.py "${pkgdir}/usr/lib/${pkgname}/main.py"
    chmod 755 "${pkgdir}/usr/lib/${pkgname}/defaultappsforge/webapp-open"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCH'
#!/bin/sh
exec python3 /usr/lib/defaultappsforge/main.py "$@"
LAUNCH
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"
    # the App Library's web apps: webapp-open --add youtube-music google-docs
    ln -s /usr/lib/${pkgname}/defaultappsforge/webapp-open "${pkgdir}/usr/bin/webapp-open"

    install -Dm644 defaultappsforge.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
