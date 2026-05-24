# Maintainer: jinzhongjia <jinzhongjia@manus.ai>

pkgname=openwarp-bin
pkgver=2026.05.22.preview
_debver=2026.05.22.preview
pkgrel=1
# Upstream renamed releases from "YYYY.MM.DD.preview" to "0.YYYY.MM.DD.HHMM",
# which sorts lower under pacman vercmp. epoch ensures clean upgrades.
# Then upstream renamed the project itself: OpenWarp → Zap (2026-05). The
# AUR package keeps the openwarp-bin name for now; provides/conflicts cover
# the zap name so users transitioning either way get a clean upgrade.
epoch=1
pkgdesc="Zap (formerly OpenWarp) - open-source fork of Warp, a Rust-based terminal with AI built in"
arch=('x86_64')
url="https://github.com/zerx-lab/zap"
license=('AGPL-3.0-only')
depends=(
    'alsa-lib'
    'dbus'
    'fontconfig'
    'libglvnd'
    'wayland'
    'libx11'
    'libxcb'
    'libxcursor'
    'libxi'
    'libxkbcommon-x11'
    'zlib'
)
optdepends=(
    'mesa: hardware-accelerated rendering'
    'adwaita-icon-theme: fallback icon theme'
    'python: bundled skill scripts (create-skill, pr-comments, feedback)'
    'python-yaml: skill validation script'
)
provides=('openwarp' 'zap' 'warp-terminal-oss')
conflicts=('zap' 'warp-terminal-oss')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/zap_${_debver}_amd64.deb")
sha256sums=('ec07f03d6ce9a4b9b1349af042a29e4f72673d2a8bcd619ba21d9e496a643f24')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/zap/zap-oss "${pkgdir}/usr/bin/zap"
    # Keep the legacy /usr/bin/openwarp symlink so existing launchers,
    # .desktop overrides, and shell aliases keep working after the rename.
    ln -s /opt/zap/zap-oss "${pkgdir}/usr/bin/openwarp"
}
