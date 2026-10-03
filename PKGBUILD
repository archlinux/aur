# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=bitlaforge
pkgver=1.0.0
pkgrel=1
pkgdesc="Solo Bitcoin mining, honestly framed: start and stop the miner, live speed, heat pause, real odds, history (Forge Suite)"
arch=('any')
url="https://github.com/jetomev/bitlaforge"
license=('GPL3')
depends=('python' 'python-textual' 'python-rich' 'python-tomlkit' 'python-forgekit>=0.5.1' 'util-linux')
# minerd is AUR-only, so it can't be a hard depends=. bitlaForge finds it at
# runtime; without it the Dashboard says so and the manual's
# "Installing the miner" page says how. util-linux gives setpriv, which makes
# the system stop the miner if bitlaForge itself ends unexpectedly.
optdepends=('cpuminer: the miner bitlaForge runs (pooler cpuminer, provides minerd)')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('c279e93e283bc61cfbbfd83566cb8306a97d9d96550522cd6bc6e871d3eafb4d'
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
    install -Dm644 bitlaforge.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    # Install the license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
