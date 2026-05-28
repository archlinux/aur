# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=alacrittyforge
pkgver=0.1.1
pkgrel=1
pkgdesc="A terminal UI for managing and customizing the Alacritty terminal emulator — safely, intuitively, and beautifully"
arch=('any')
url="https://github.com/jetomev/alacrittyforge"
license=('GPL3')
depends=('python' 'python-textual' 'python-rich' 'python-tomli-w')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cfb930e7edb77aae74154181d615cf6d56d1641e21610c321c9c7b135828528d')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Headless smoke test: import AND mount the app under Textual's test
    # harness. Catches Textual API breaks AND mount-time failures (CSS
    # parse errors, bad widget ids, on_mount crashes) at build time. We
    # never ship a package that imports but won't launch. (With no
    # ~/.config/alacritty/alacritty.toml in the build env the app still
    # mounts cleanly — config_manager handles the missing-file case.)
    #
    # PYTHONDONTWRITEBYTECODE=1 prevents .pyc cache files from landing in
    # the source tree during the smoke; without it, package()'s
    # `cp -r alacrittyforge` would bundle them and they'd conflict on
    # install with user-runtime .pyc files at the same paths (the
    # grubForge v1.0.2 install-conflict class — don't repeat it).
    PYTHONDONTWRITEBYTECODE=1 python -c "
import sys, asyncio
sys.path.insert(0, '.')
from alacrittyforge.app import AlacrittyForge
async def _smoke():
    app = AlacrittyForge()
    async with app.run_test() as pilot:
        await pilot.pause()
asyncio.run(_smoke())
print('alacrittyforge headless mount OK')
"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Defensive cleanup: belt-and-suspenders alongside check()'s
    # PYTHONDONTWRITEBYTECODE=1 — make sure no stray .pyc caches sneak
    # into the package.
    find alacrittyforge -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    # Install the Python package
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r alacrittyforge "${pkgdir}/usr/lib/${pkgname}/"
    cp main.py "${pkgdir}/usr/lib/${pkgname}/"

    # Install the launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
exec python /usr/lib/alacrittyforge/main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Install the man page
    install -Dm644 alacrittyforge.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    # Install the license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
