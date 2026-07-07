# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=zap-oss-bin
pkgver=2026.07.07.1
_debver=2026.07.07.1
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
sha256sums=('db8e4d53230793ee32907adba71c898dd31b3abf805f5c6e7baa1052fc4ebd40')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

    install -d "${pkgdir}/usr/bin"
    # Use zap-oss (the binary's actual name) rather than /usr/bin/zap, to
    # avoid colliding with the unrelated `zap-bin` AppImage-manager package.
    ln -s /opt/zap/zap-oss "${pkgdir}/usr/bin/zap-oss"
    # Keep the legacy /usr/bin/openwarp symlink so existing launchers,
    # .desktop overrides, and shell aliases keep working after the rename.
    ln -s /opt/zap/zap-oss "${pkgdir}/usr/bin/openwarp"

    # Upstream desktop file ships `Exec=zap %U`, expecting a /usr/bin/zap
    # wrapper that we deliberately don't install (would collide with the
    # unrelated `zap-bin` AppImage-manager AUR package). Point Exec at the
    # symlink we actually provide.
    sed -i 's|^Exec=zap %U$|Exec=zap-oss %U|' \
        "${pkgdir}/usr/share/applications/dev.zap.Zap.desktop"
}
