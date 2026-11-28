# Maintainer: czyt <czytcn@gmail.com>
pkgname=magpie-bin
pkgver=0.1.4988
pkgrel=1
pkgdesc="One place to pick every AI coding agent's model: Codex, Claude Code, Gemini CLI and more"
arch=('x86_64' 'aarch64')
url="https://usemagpie.ai"
license=('MIT')
depends=('glib2' 'gtk3' 'gdk-pixbuf2' 'hicolor-icon-theme' 'libsoup3' 'libx11' 'webkit2gtk-4.1')
# Upstream installs its binary as `magpie`, which is also the binary of the
# unrelated AUR package magpie (an IPv6 NDP proxy).
provides=('magpie')
conflicts=('magpie')
options=('!strip' '!debug')

# The desktop build of magpie (needs GTK 3 + WebKitGTK 4.1); the static
# terminal build ships as the separate magpie-cli-bin package.
source=(
    "magpie-${pkgver}-LICENSE::https://raw.githubusercontent.com/yetone/magpie/v${pkgver}/LICENSE"
    "magpie-icon-${pkgver}.png::https://usemagpie.ai/img/icon-256.png"
)
source_x86_64=(
    "magpie-${pkgver}-amd64::https://github.com/yetone/magpie-releases/releases/download/v${pkgver}/magpie-linux-amd64"
)
source_aarch64=(
    "magpie-${pkgver}-arm64::https://github.com/yetone/magpie-releases/releases/download/v${pkgver}/magpie-linux-arm64"
)
sha256sums=('79d2c8444715d4bc453ec4f8a0aaf2051a4c1ee5ac08f5bd2e5848aef87c7572'
            '57437c6596e05a8fcfc42d4288c030aa00ed86b69fe35d464d69d7026150c704')
sha256sums_x86_64=('f161db35dc4b6045ebdef3bf4f7ae3d17f57d931183af8a338b1aa0718cbf454')
sha256sums_aarch64=('824674cce806bc1c0409111feb68a8c574596aec65cf654735527c09d348c7c1')

package() {
    local _suffix
    case "$CARCH" in
        x86_64)  _suffix=amd64 ;;
        aarch64) _suffix=arm64 ;;
    esac

    install -Dm755 "${srcdir}/magpie-${pkgver}-${_suffix}" "${pkgdir}/usr/bin/magpie"

    install -Dm644 "${srcdir}/magpie-icon-${pkgver}.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/magpie.png"
    install -Dm644 "${srcdir}/magpie-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/magpie-bin/LICENSE"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/magpie.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=magpie
Comment=Every agent's model. One place.
Exec=/usr/bin/magpie app
Icon=magpie
Categories=Development;Utility;
Terminal=false
EOF
}
