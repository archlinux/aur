# Maintainer: czyt <czytcn@gmail.com>
pkgname=zeron-bin
pkgver=0.2.130
pkgrel=1
pkgdesc="A native control plane for Claude Code, Codex, Cursor, Devin and other coding agents"
arch=('x86_64' 'aarch64')
url="https://zeron.sh"
license=('MIT')
# The binary needs the ALSA runtime even in headless mode and a Vulkan loader
# for its GPUI renderer; Wayland sessions additionally load libwayland-client.
depends=('alsa-lib' 'gcc-libs' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader' 'wayland')
optdepends=(
    'vulkan-radeon: AMD GPU support'
    'vulkan-intel: Intel GPU support'
    'nvidia-utils: NVIDIA GPU support'
    'webkit2gtk-4.1: built-in browser tabs'
    'json-glib: built-in browser tabs'
)
provides=('zeron')
conflicts=('zeron')
options=('!strip' '!debug')

source_x86_64=("zeron-${pkgver}-linux-x86_64.tar.gz::https://github.com/zeronsh/zeron/releases/download/v${pkgver}/zeron-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("zeron-${pkgver}-linux-aarch64.tar.gz::https://github.com/zeronsh/zeron/releases/download/v${pkgver}/zeron-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('e5f0275b0b6034635dd9e7df0a3b7a3cf86493545388869e366998fb4a333ba4')
sha256sums_aarch64=('71166d0546617df1905e7563392d06551967ef05fb356ea21b04cde663d6c7ca')

package() {
    local _appdir="zeron-${pkgver}-linux-${CARCH}"

    install -Dm755 "${srcdir}/${_appdir}/zeron" "${pkgdir}/usr/bin/zeron"
    install -Dm644 "${srcdir}/${_appdir}/zeron.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/zeron.png"

    install -Dm644 "${srcdir}/${_appdir}/zeron.desktop" \
        "${pkgdir}/usr/share/applications/zeron.desktop"
    # The tarball entry relies on `zeron` being on the session PATH; use
    # absolute paths for a system-wide install.
    sed -i 's|^Exec=.*|Exec=/usr/bin/zeron %u|' "${pkgdir}/usr/share/applications/zeron.desktop"
    sed -i 's|^TryExec=.*|TryExec=zeron|' "${pkgdir}/usr/share/applications/zeron.desktop"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -a "${srcdir}/${_appdir}/licenses/." "${pkgdir}/usr/share/licenses/${pkgname}/"
}
