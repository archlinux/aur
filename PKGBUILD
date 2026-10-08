# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=python-forgekit
_srcname=forgekit
pkgver=0.9.0
pkgrel=1
pkgdesc="Shared Textual TUI shell library for the Forge Suite — menu bar, dialogs, settings forms and save flows, a start-up check, a centred password box, Catppuccin theme"
arch=('any')
# 0.7.0: forgekit lives in the Forge Suite repository (D-60); releases are tagged forgekit-vX.Y.Z there
_repo="https://github.com/jetomev/forge-suite"
url="${_repo}/tree/main/forgekit"
license=('GPL3')
# 0.6.0: python-pyte draws a program's screen inside the app (RunWindow)
depends=('python' 'python-textual' 'python-rich' 'python-pyte')
optdepends=('python-gobject: the polkit password asked inside the app (grubForge)'
            'polkit: the same')
source=("${_srcname}-${pkgver}.tar.gz::${_repo}/releases/download/${_srcname}-v${pkgver}/${_srcname}-${pkgver}.tar.gz"
        "${_srcname}-${pkgver}.tar.gz.asc::${_repo}/releases/download/${_srcname}-v${pkgver}/${_srcname}-${pkgver}.tar.gz.asc")
sha256sums=('ef49b3c6a92c47192717580588e12c4cc5c030a421d9450dd895c6344e83d2f6'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${_srcname}-${pkgver}"
    # Headless smoke: import the full public API and mount a minimal
    # ForgeApp under Textual's test harness — catches Textual API breaks
    # and CSS parse errors at build time (the bitlaforge check() pattern).
    PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=. python -c "
import asyncio
from forgekit import (ForgeApp, ForgeModal, ConfirmDialog, ForgePanelScreen,
                      MenuBar, FORGE_CSS, COLORS, GPL3_NOTICE, __version__,
                      ROLES, glyph, console_mode,
                      SettingRow, ReviewDialog, ProgressDialog, ManualScreen,  # 0.5.0
                      TerminalPane, RunWindow, PasswordBridge, PasswordDialog, InAppPolkitAgent,  # 0.6.0
                      start_check, Need, NeedsApp, sway_session, program, service, a_file,  # 0.7.0
                      PasswordField)  # 0.8.0
assert __version__ == '${pkgver}', __version__

class _Smoke(ForgeApp):
    APP_NAME = 'smoke'
    MENU = [{'id': 'one', 'title': 'One', 'kind': 'section'},
            {'id': 'quit', 'title': 'Quit', 'kind': 'action', 'action': 'quit'}]
    def compose_sections(self):
        from textual.widgets import Static
        yield Static('ok', id='sec-one')

async def _run():
    # both modes: a terminal window and a plain text console (0.4.0)
    for console in (False, True):
        app = _Smoke(console=console)
        async with app.run_test() as pilot:
            await pilot.pause()
            assert app.forge_console is console
asyncio.run(_run())
print('forgekit headless mount OK (window and console mode)')
"""
    # 0.6.0: a program's run and its password inside the app, in a real
    # pseudo-terminal with stand-in tools (no sudo, no polkit needed)
    PYTHONDONTWRITEBYTECODE=1 python -m unittest tests.test_v06
    # 0.7.0: the start-up check, every kind of need fed a known-bad input
    PYTHONDONTWRITEBYTECODE=1 python -m unittest tests.test_v07
    # 0.8.0: the password's dots centred, measured on the drawn line
    PYTHONDONTWRITEBYTECODE=1 python -m unittest tests.test_v08
    # 0.9.0: the menu bar wraps on a narrow window — titles on screen by position, a second-row click
    PYTHONDONTWRITEBYTECODE=1 python -m unittest tests.test_menubar
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
