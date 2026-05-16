# Maintainer: Gianluca Mazza <info@gianlucamazza.it>
pkgname=hyprland-agent
pkgver=1.5.0
pkgrel=1
pkgdesc="Local-first agentic desktop controller for Hyprland / Wayland"
arch=('any')
url="https://github.com/gianlucamazza/hyprland-agent"
license=('Apache-2.0')
depends=(
    'python>=3.13'
    # Python runtime deps (official repos)
    'python-pydantic'
    'python-rich'
    'python-typer'
    'python-textual'
    'python-openai'
    'python-yaml'
    'python-pillow'
    'python-jeepney'
    # Python runtime deps (AUR)
    'python-anthropic'
    'python-sqlite-vec'
    'python-fastembed'
    # System binaries
    'wtype'
    'ydotool'
    'grim'
    'wl-clipboard'
    'sqlite'
)
optdepends=(
    'mako: desktop notifications via notify-send'
    'waybar: agent-waybar status module'
    'fuzzel: fuzzel-agent task launcher'
    'foot: terminal emulator used by the hyprland-agent-tui.desktop launcher'
)
makedepends=('python-installer' 'uv')
provides=('hyprland-agent')
conflicts=('hyprland-agent')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gianlucamazza/hyprland-agent/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9cddfe8013f74e47cbe37220e3c84192f42c508093f5db8889131b401470ef54')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    uv build --wheel --out-dir dist/
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    # systemd user service
    install -Dm644 packaging/systemd/hyprland-agent.service \
        "${pkgdir}/usr/lib/systemd/user/hyprland-agent.service"

    # desktop entry
    install -Dm644 packaging/desktop/hyprland-agent-tui.desktop \
        "${pkgdir}/usr/share/applications/hyprland-agent-tui.desktop"

    # docs
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
