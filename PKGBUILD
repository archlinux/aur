# ─────────────────────────────────────────────────────────────────────────────
# PKGBUILD — Steam Grunge Editor (Arch Linux / AUR)
#
# Build locally:
#   makepkg -si
#
# Submit to AUR:
#   1. Create AUR account at https://aur.archlinux.org
#   2. Clone your AUR repo: git clone ssh://aur@aur.archlinux.org/steam-grunge-editor.git
#   3. Copy PKGBUILD + .SRCINFO into the AUR repo and push
# ─────────────────────────────────────────────────────────────────────────────

pkgname=steam-grunge-editor
pkgver=1.0.0
pkgrel=1
pkgdesc="Grunge-style Steam artwork editor — create distressed covers, heroes, logos and icons for your Steam library"
arch=('any')
url="https://github.com/Huzzama/Steam-Grunge"
license=('MIT')
depends=(
    'python>=3.10'
    'python-pip'
    'python-virtualenv'
    'libgl'
)
makedepends=('python-pip')
optdepends=(
    'steam: sync artwork directly to Steam'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Huzzama/Steam-Grunge/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ac61cc2a7c82e47f2e3a075b4c781751e83a71a9c4d85149ebe723de47c8e5b8 ')   # replace with actual sha256 after tagging a release

prepare() {
    cd "Steam-Grunge-${pkgver}"
    # Create venv and install deps
    python3 -m venv venv
    venv/bin/pip install --quiet --upgrade pip
    venv/bin/pip install --quiet -r requirements.txt
}

package() {
    cd "Steam-Grunge-${pkgver}"

    # Application files
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r app "${pkgdir}/usr/lib/${pkgname}/"
    cp requirements.txt "${pkgdir}/usr/lib/${pkgname}/"
    cp -r venv "${pkgdir}/usr/lib/${pkgname}/"

    # Launcher
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCHER'
#!/usr/bin/env bash
exec /usr/lib/steam-grunge-editor/venv/bin/python \
     /usr/lib/steam-grunge-editor/app/main.py "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Desktop file
    install -Dm644 "packaging/desktop/steam-grunge-editor.desktop" \
        "${pkgdir}/usr/share/applications/steam-grunge-editor.desktop"

    # Icon
    install -Dm644 "app/assets/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/steam-grunge-editor.png"

    # License
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
