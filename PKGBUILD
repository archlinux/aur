# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=nogforge
pkgver=1.1.0
pkgrel=1
pkgdesc="Packages the KognogOS way, in a terminal: what's installed, searching and installing, and updates you can read, on top of nog"
arch=('any')
url="https://github.com/jetomev/nogforge"
license=('GPL3')
# nog 1.6.1: the --json answers nogForge reads, and `nog update a b c` (only
# the ticked ones). forgekit 0.5.2: the Forge Suite's shared base (the bottom
# bar that follows the screen). Both must be on the AUR first: dependency order.
depends=('python' 'python-textual' 'python-rich' 'python-forgekit>=0.6.0' 'nog>=1.7.0')
# v1.1.0: nog runs inside nogForge and the password is asked in its own box:
# no desktop password window needed (forgekit 0.6.0); nog 1.7.0 reports its steps
optdepends=('archlinux-appstream-data: app names and category badges')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('e42765299dfd1a4059638243d5b64ae9367e923f11d88df8191e1d75d153a27b'
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
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
