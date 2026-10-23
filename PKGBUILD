# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=bitlaforge
pkgver=1.1.1
pkgrel=1
pkgdesc="Solo Bitcoin mining, honestly framed: start and stop the miner, live speed, heat pause, real odds, history. Any Linux distribution, no desktop needed, works on a text console (Forge Suite)"
arch=('any')
# bitlaForge lives in the Forge Suite repository since 1.1.1 (D-60); releases are tagged bitlaforge-vX.Y.Z there
_repo="https://github.com/jetomev/forge-suite"
url="${_repo}/tree/main/bitlaforge"
license=('GPL3')
depends=('python' 'python-textual' 'python-rich' 'python-tomlkit' 'python-forgekit>=0.10.0' 'util-linux')
# minerd is AUR-only, so it can't be a hard depends=. bitlaForge finds it at
# runtime; without it the Dashboard says so and the manual's
# "Installing the miner" page says how. util-linux gives setpriv, which makes
# the system stop the miner if bitlaForge itself ends unexpectedly.
optdepends=('cpuminer: the miner bitlaForge runs (pooler cpuminer, provides minerd)')
# 1.1.1: check() validates the launcher entry
checkdepends=('desktop-file-utils')
source=("${pkgname}-${pkgver}.tar.gz::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${_repo}/releases/download/${pkgname}-v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('a199469c805deee9adfdc091c746a87c10eafa789d5844b3c1b34a61ff3a2383'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Everything in throwaway folders: the builder's own settings, history and
    # cache are never read or written. No real miner is run (the tests use a
    # stand-in script) and nothing is sent anywhere.
    local tmp
    tmp="$(mktemp -d)"
    export XDG_CONFIG_HOME="$tmp/config" XDG_DATA_HOME="$tmp/data" XDG_CACHE_HOME="$tmp/cache"
    export PYTHONDONTWRITEBYTECODE=1
    python -c "
import sys, asyncio
sys.path.insert(0, '.')
from bitlaforge import __version__
assert __version__ == '${pkgver}', __version__
from bitlaforge.app import BitlaForgeApp
async def _smoke():
    app = BitlaForgeApp()
    app.fetch_odds = lambda: None          # no internet during a build
    async with app.run_test() as pilot:
        await pilot.pause()
asyncio.run(_smoke())
print('bitlaforge headless mount OK')
"
    python -m unittest discover tests
    # 1.1.1 (forge-suite#118): the launcher entry is valid
    desktop-file-validate bitlaforge.desktop
    rm -rf --one-file-system "$tmp"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Defensive cleanup: belt-and-suspenders alongside check()'s
    # PYTHONDONTWRITEBYTECODE=1 to ensure no stray .pyc caches sneak
    # into the package.
    find bitlaforge -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    # Install the Python package (the manual travels inside it)
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r bitlaforge "${pkgdir}/usr/lib/${pkgname}/"
    cp main.py "${pkgdir}/usr/lib/${pkgname}/"

    # Install the launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
exec python /usr/lib/bitlaforge/main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Install the man page
    # the launcher entry (1.1.1, forge-suite#118): the app shows in every app menu and launcher
    install -Dm644 bitlaforge.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 bitlaforge.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    # Install the license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
