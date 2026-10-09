# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=alacrittyforge
pkgver=1.1.0
pkgrel=1
pkgdesc="Alacritty's settings without editing the file by hand: plain-word settings, a review before every save, your notes kept"
arch=('any')
url="https://github.com/jetomev/alacrittyforge"
license=('GPL3')
# v1.0.0: tomlkit edits alacritty.toml as a document, so comments and layout
# stay (tomli_w rewrote the whole file); forgekit 0.5.1 for decimal and wide
# number fields; fontconfig's fc-list lists the fonts
depends=('python' 'python-textual' 'python-rich' 'python-tomlkit' 'python-forgekit>=0.10.0' 'fontconfig')
optdepends=('alacritty: the terminal these settings are for (alacrittyForge reads its version)')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('2e540de6c4bb00bfdaae1edc3c36745b05b29c40c6a9d4a8324c76a8887aea1b'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Headless smoke test: import AND mount the app under Textual's test
    # harness. Catches Textual API breaks AND mount-time failures (CSS
    # parse errors, bad widget ids, on_mount crashes) at build time. We
    # never ship a package that imports but won't launch. (With no
    # ~/.config/alacritty/alacritty.toml it still mounts; the smoke uses a
    # temporary one so a build never touches the builder's own settings.)
    #
    # PYTHONDONTWRITEBYTECODE=1 prevents .pyc cache files from landing in
    # the source tree during the smoke; without it, package()'s
    # `cp -r alacrittyforge` would bundle them and they'd conflict on
    # install with user-runtime .pyc files at the same paths (the
    # grubForge v1.0.2 install-conflict class — don't repeat it).
    PYTHONDONTWRITEBYTECODE=1 python -c "
import sys, asyncio, tempfile
from pathlib import Path
sys.path.insert(0, '.')
from alacrittyforge.app import AlacrittyForgeApp
from alacrittyforge.session import Session
async def _smoke():
    d = Path(tempfile.mkdtemp())
    app = AlacrittyForgeApp(session=Session.load(d / 'alacritty.toml', backup_dir=d / 'bk', themes_dir=d / 't'))
    async with app.run_test() as pilot:
        await pilot.pause()
asyncio.run(_smoke())
print('alacrittyforge headless mount OK')
"

    # v1.0.0: every screen's flows headless, safe saving, themes, shortcuts,
    # each Alacritty version's setting names, the manual — 80 tests, no
    # Alacritty and no display needed.
    PYTHONDONTWRITEBYTECODE=1 python -m unittest tests.test_saving tests.test_session \
        tests.test_themes tests.test_bindings tests.test_versions tests.test_manual tests.test_screens \
        tests.test_v110
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
