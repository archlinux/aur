# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=grubforge
pkgver=1.0.3
pkgrel=1
pkgdesc="A terminal UI for managing and customizing the GRUB bootloader — safely, intuitively, and beautifully"
arch=('any')
url="https://github.com/jetomev/grubforge"
license=('GPL3')
depends=('python' 'python-textual' 'python-rich')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e443c2d510768e279e9d7073720f0e6f9f8eb6a59fe248c93bfb4cafa378adbe')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Headless smoke test: import AND mount the app under Textual's test
    # harness. The v1.0.2 import smoke caught Textual API breaks (the v1.0.1
    # F16 Static.Clicked removal); v1.0.3 widens it to a full headless mount
    # so build-time failures beyond import — CSS parse errors, bad widget ids,
    # on_mount crashes — are caught too. We never ship a package that imports
    # but won't launch. (With no /etc/default/grub or /boot in the build env,
    # the app mounts cleanly in mock mode.)
    #
    # PYTHONDONTWRITEBYTECODE=1 prevents Python from writing .pyc cache files
    # into the source tree during the smoke. Without this, those .pyc files
    # get picked up by package()'s `cp -r grubforge` below, land at
    # /usr/lib/grubforge/.../__pycache__/, and conflict on install with the
    # .pyc files that user-runtime Python generates at the same paths
    # (pacman refuses to overwrite untracked-but-existing files).
    PYTHONDONTWRITEBYTECODE=1 python -c "
import sys, asyncio
sys.path.insert(0, '.')
from grubforge.app import GrubForgeApp
async def _smoke():
    app = GrubForgeApp()
    async with app.run_test() as pilot:
        await pilot.pause()
asyncio.run(_smoke())
print('grubforge headless mount OK')
"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Defensive cleanup: ensure no stray .pyc caches make it into the package.
    # Belt-and-suspenders alongside check()'s PYTHONDONTWRITEBYTECODE.
    find grubforge -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    # Install the Python package
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r grubforge "${pkgdir}/usr/lib/${pkgname}/"
    cp main.py "${pkgdir}/usr/lib/${pkgname}/"

    # Install the launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
exec python /usr/lib/grubforge/main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Install the man page
    install -Dm644 grubforge.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    # Install the license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
