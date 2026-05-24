# Maintainer: jinzhongjia <jinzhongjia@manus.ai>

pkgname=zap-oss-bin
pkgver=2026.05.22.preview
_debver=2026.05.22.preview
pkgrel=1
# Upstream renamed releases from "YYYY.MM.DD.preview" to "0.YYYY.MM.DD.HHMM",
# which sorts lower under pacman vercmp. epoch ensures clean upgrades.
# This package replaces openwarp-bin (project was renamed OpenWarp → Zap).
# Named zap-oss-* (after the binary `zap-oss`) because the AUR names
# zap-bin / zap-git are taken by unrelated projects (an AppImage manager
# and a web-shortcuts tool, respectively).
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
provides=('zap-oss' 'openwarp' 'warp-terminal-oss')
conflicts=('openwarp-bin' 'zap-oss-git' 'warp-terminal-oss')
replaces=('openwarp-bin')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/zap_${_debver}_amd64.deb")
sha256sums=('ec07f03d6ce9a4b9b1349af042a29e4f72673d2a8bcd619ba21d9e496a643f24')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

    install -d "${pkgdir}/usr/bin"
    # Use zap-oss (the binary's actual name) rather than /usr/bin/zap, to
    # avoid colliding with the unrelated `zap-bin` AppImage-manager package.
    ln -s /opt/zap/zap-oss "${pkgdir}/usr/bin/zap-oss"
    # Keep the legacy /usr/bin/openwarp symlink so existing launchers,
    # .desktop overrides, and shell aliases keep working after the rename.
    ln -s /opt/zap/zap-oss "${pkgdir}/usr/bin/openwarp"
}
