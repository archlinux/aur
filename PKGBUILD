# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=python-forgekit
_srcname=forgekit
pkgver=0.3.0
pkgrel=1
pkgdesc="Shared Textual TUI shell library for the Forge Suite — menu bar, sections, floating dialogs, Catppuccin theme"
arch=('any')
url="https://github.com/jetomev/forgekit"
license=('GPL3')
depends=('python' 'python-textual' 'python-rich')
source=("${_srcname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_srcname}-${pkgver}.tar.gz"
        "${_srcname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${_srcname}-${pkgver}.tar.gz.asc")
sha256sums=('a52e9ba203198f707db6c34d3a68c29a5e662f32b2379b4e19278a2f7ae1a4a2'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   gpg --keyserver keys.openpgp.org --recv-keys 32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${_srcname}-${pkgver}"
    # Headless smoke: import the full public API and mount a minimal
    # ForgeApp under Textual's test harness — catches Textual API breaks
    # and CSS parse errors at build time (the bitlaforge check() pattern).
    PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=. python -c "
import asyncio
from forgekit import (ForgeApp, ForgeModal, ConfirmDialog, ForgePanelScreen,
                      MenuBar, FORGE_CSS, COLORS, GPL3_NOTICE, __version__)
assert __version__ == '${pkgver}', __version__

class _Smoke(ForgeApp):
    APP_NAME = 'smoke'
    MENU = [{'id': 'one', 'title': 'One', 'kind': 'section'},
            {'id': 'quit', 'title': 'Quit', 'kind': 'action', 'action': 'quit'}]
    def compose_sections(self):
        from textual.widgets import Static
        yield Static('ok', id='sec-one')

async def _run():
    app = _Smoke()
    async with app.run_test() as pilot:
        await pilot.pause()
asyncio.run(_run())
print('forgekit headless mount OK')
"
}

package() {
    cd "${srcdir}/${_srcname}-${pkgver}"

    # Defensive: no stray .pyc caches in the package.
    find forgekit -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    # Pure-python library → straight into site-packages.
    local sitedir
    sitedir=$(python -c "import site; print(site.getsitepackages()[0])")
    install -dm755 "${pkgdir}${sitedir}"
    cp -r forgekit "${pkgdir}${sitedir}/"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
