# Maintainer: jinzhongjia <jinzhongjia@manus.ai>

pkgname=openwarp-bin
pkgver=0.2026.05.13.1008
_debver=0.2026.05.13.1008
pkgrel=1
# Upstream renamed releases from "YYYY.MM.DD.preview" to "0.YYYY.MM.DD.HHMM",
# which sorts lower under pacman vercmp. epoch ensures clean upgrades.
epoch=1
pkgdesc="OpenWarp - open-source fork of Warp, a Rust-based terminal with AI built in"
arch=('x86_64')
url="https://github.com/zerx-lab/warp"
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
provides=('openwarp' 'warp-terminal-oss')
conflicts=('warp-terminal-oss')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/warp-terminal-oss_${_debver}_amd64.deb")
sha256sums=('1aa7a0faf29852fb66fa1f0b3fd9c6247aa71df8f83b792b4584a4586555006d')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

    # Upstream desktop entry sets StartupWMClass=dev.warp.OpenWarp, but the
    # running app uses WM_CLASS=dev.openwarp.OpenWarp, so GNOME can't match
    # the window to the .desktop and falls back to a generic icon.
    sed -i 's/^StartupWMClass=dev\.warp\.OpenWarp$/StartupWMClass=dev.openwarp.OpenWarp/' \
        "${pkgdir}/usr/share/applications/dev.warp.OpenWarp.desktop"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/warpdotdev/warp-terminal-oss/warp-oss "${pkgdir}/usr/bin/warp-terminal-oss"
    ln -s /opt/warpdotdev/warp-terminal-oss/warp-oss "${pkgdir}/usr/bin/openwarp"
}
