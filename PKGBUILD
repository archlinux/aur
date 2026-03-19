# Maintainer: Huzzama <https://github.com/Huzzama>
# ─────────────────────────────────────────────────────────────────────────────
# Steam Grunge Editor — AUR package
#
# AUR page: https://aur.archlinux.org/packages/steam-grunge-editor
# Source:   https://github.com/Huzzama/Steam-Grunge
#
# Installation:
#   yay -S steam-grunge-editor
#   paru -S steam-grunge-editor
#   # or manually:
#   git clone https://aur.archlinux.org/steam-grunge-editor.git
#   cd steam-grunge-editor && makepkg -si
#
# Steam Deck (SteamOS / Arch-based):
#   The same commands work in Desktop Mode with yay or paru installed.
#
# v2.1.0 changes:
#   - pkgver bumped to 2.1.0
#   - arch changed 'any' → 'x86_64': the venv contains compiled extensions
#     (PySide6, numpy). 'any' is only valid for pure-Python or arch-agnostic
#     packages; using it here causes AUR helpers to skip arch checks silently.
#   - Fixed sha256sums array format (was a bare string — caused makepkg to
#     fail checksum verification with "unexpected token")
#   - Moved python-pip and python-virtualenv from depends → makedepends:
#     they are only needed to build the venv, not to run the installed app
#   - Added libxcb-util, libxcb-cursor, xcb-util-keysyms, xcb-util-wm,
#     xcb-util-renderutil to depends — required by PySide6/Qt6 xcb platform
#     plugin; missing these causes "Could not load Qt platform plugin xcb"
#   - Fixed venv hardcoded-path bug in prepare(): venv was built inside the
#     srcdir with absolute paths baked in, then copied to pkgdir — Python
#     would look for interpreter at wrong path after install. Now the venv
#     is NOT pre-built; instead a post-install script builds it in-place
#     under /usr/lib/steam-grunge-editor/ on first run.
#   - Added steam-grunge-editor.install for post-install hooks (venv setup,
#     icon cache, desktop database refresh)
#   - Added VERSION file to installed files (required by update checker)
#   - Added install -Dm644 for LICENSE (was missing in some builds)
#   - Launcher updated with guard: shows actionable error if venv is missing
# ─────────────────────────────────────────────────────────────────────────────

pkgname=steam-grunge-editor
pkgver=2.1.0
pkgrel=1
pkgdesc="Grunge-style Steam artwork editor — create distressed covers, heroes, logos and icons for your Steam library"
arch=('x86_64')
url="https://github.com/Huzzama/Steam-Grunge"
license=('MIT')

depends=(
    'python>=3.10'
    # Qt6 / PySide6 platform plugin (xcb) hard requirements
    'libgl'
    'libxcb'
    'xcb-util-cursor'
    'xcb-util-keysyms'
    'xcb-util-wm'
    'xcb-util-renderutil'
    'libxkbcommon-x11'
    'dbus'
)

makedepends=(
    'python-pip'
    'python-virtualenv'
)

optdepends=(
    'steam: sync artwork directly to your Steam library'
    'flatpak: alternative Steam install (Steam Deck default)'
)

# .install file runs post-install hooks (venv setup, icon/desktop cache)
install="${pkgname}.install"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Huzzama/Steam-Grunge/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('f3072a0bd50f286483b04b9e83de0d0127378b41c79f0d600c5b2c40da12d842')

# ─────────────────────────────────────────────────────────────────────────────
prepare() {
    cd "Steam-Grunge-${pkgver}"
    # Nothing to compile — venv is built on the target machine by the
    # .install post_install() hook so Python paths are correct for the
    # final install location (/usr/lib/steam-grunge-editor/venv).
    # Attempting to pre-build the venv here would bake srcdir absolute
    # paths into every .pth and interpreter shebang — broken after install.
    :
}

# ─────────────────────────────────────────────────────────────────────────────
package() {
    cd "Steam-Grunge-${pkgver}"

    # ── Application files → /usr/lib/steam-grunge-editor/ ────────────────────
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r app              "${pkgdir}/usr/lib/${pkgname}/"
    cp    requirements.txt "${pkgdir}/usr/lib/${pkgname}/"

    # VERSION file — read at runtime by mainWindow.py for APP_VERSION
    # and by the update checker to compare against GitHub releases
    if [ -f VERSION ]; then
        install -Dm644 VERSION "${pkgdir}/usr/lib/${pkgname}/VERSION"
    else
        echo "${pkgver}" > "${pkgdir}/usr/lib/${pkgname}/VERSION"
    fi

    # ── Launcher → /usr/bin/steam-grunge-editor ───────────────────────────────
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCHER'
#!/usr/bin/env bash
# Steam Grunge Editor launcher
# Activates the private venv and runs the app.
VENV="/usr/lib/steam-grunge-editor/venv"
APP="/usr/lib/steam-grunge-editor/app/main.py"

if [ ! -f "$VENV/bin/python" ]; then
    echo "ERROR: Steam Grunge Editor Python environment not found."
    echo ""
    echo "The venv may not have been set up yet. Run:"
    echo "  sudo python3 -m venv $VENV"
    echo "  sudo $VENV/bin/pip install -r /usr/lib/steam-grunge-editor/requirements.txt"
    exit 1
fi

exec "$VENV/bin/python" "$APP" "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # ── Desktop entry → /usr/share/applications/ ──────────────────────────────
    install -Dm644 "packaging/desktop/steam-grunge-editor.desktop" \
        "${pkgdir}/usr/share/applications/steam-grunge-editor.desktop"

    # ── Icons ─────────────────────────────────────────────────────────────────
    install -Dm644 "app/assets/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/steam-grunge-editor.png"

    # ── License ───────────────────────────────────────────────────────────────
    if [ -f LICENSE ] ; then
        install -DM644 LICENSE \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
