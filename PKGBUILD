# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=bitlaforge
pkgver=0.2.1
pkgrel=1
pkgdesc="A terminal UI for running solo Bitcoin mining as the lottery it really is — wraps minerd in a Catppuccin Mocha Textual TUI"
arch=('any')
url="https://github.com/jetomev/bitlaforge"
license=('GPL3')
depends=('python' 'python-textual' 'python-rich' 'python-tomli-w' 'python-forgekit>=0.2.1')
# minerd is itself AUR-only (three flavours), so it can't be a hard depends=.
# BitlaForge detects the missing case at runtime and guides the user to
# install one via Help → Install & Setup.
optdepends=('cpuminer: pooler cpuminer (recommended) — provides /usr/bin/minerd'
            'cpuminer-multi: multi-algorithm cpuminer fork'
            'cpuminer-opt: heavily optimized multi-algo variant')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('c31313f4e634603fcb7e858ca827529820f82df76e921da86178e918e6857ff4'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   gpg --keyserver keys.openpgp.org --recv-keys 32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Headless smoke test: import AND mount the app under Textual's test
    # harness. Catches Textual API breaks AND mount-time failures (CSS
    # parse errors, bad widget ids, on_mount crashes) at build time. We
    # never ship a package that imports but won't launch. Note: check()
    # does NOT spawn minerd — it tests that the UI shell mounts cleanly,
    # not the mining lifecycle (which would need real minerd in the
    # build env and real network).
    #
    # PYTHONDONTWRITEBYTECODE=1 prevents .pyc cache files from landing
    # in the source tree during the smoke. Without it, package()'s
    # `cp -r bitlaforge` would bundle them and they'd conflict on
    # install with user-runtime .pyc files at the same paths (the
    # grubForge v1.0.2 install-conflict class — don't repeat it).
    PYTHONDONTWRITEBYTECODE=1 python -c "
import sys, asyncio
sys.path.insert(0, '.')
from bitlaforge.app import BitlaForgeApp
async def _smoke():
    app = BitlaForgeApp()
    async with app.run_test() as pilot:
        await pilot.pause()
asyncio.run(_smoke())
print('bitlaforge headless mount OK')
"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Defensive cleanup: belt-and-suspenders alongside check()'s
    # PYTHONDONTWRITEBYTECODE=1 to ensure no stray .pyc caches sneak
    # into the package.
    find bitlaforge -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    # Install the Python package
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
