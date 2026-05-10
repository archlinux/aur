# Maintainer: jinzhongjia <jinzhongjia@manus.ai>

pkgname=openwarp-bin
pkgver=2026.05.10.preview
_debver=2026.05.10.preview
pkgrel=1
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
sha256sums=('d3070ccd8e3fceddbe439485c1a706a5ffc61e59d6caf9a6e5b726d34babdb63')

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
