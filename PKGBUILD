# Maintainer:czyt <czytcn@gmail.com>
# Upstream only ships x86_64. To add aarch64 later:
#   1. add source_aarch64 / sha256sums_aarch64 with a distinct local filename
#   2. add 'aarch64' to arch=()
#   3. extend the CARCH switch in package() below
pkgname=lzc-client-bin
pkgver=2.0.30
pkgrel=3
pkgdesc='懒猫微服桌面客户端（LCMD），扫码登录后管理微服应用、文件与远程访问'
arch=('x86_64')
url='https://lazycat.cloud/'
license=('custom')
install="${pkgname}.install"
provides=('lzc-client-desktop' 'lazycat-client')
conflicts=('lzc-client-desktop' 'lazycat-client')
depends=(
  'zenity'
  'libcap'
  'glib2'
  'nspr'
  'nss'
  'dbus'
  'at-spi2-core'
  'libcups'
  'cairo'
  'gtk3'
  'pango'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxrandr'
  'mesa'
  'expat'
  'libxcb'
  'libxkbcommon'
  'systemd-libs'
  'alsa-lib'
)
makedepends=('zstd')
source_x86_64=("lzc-client-desktop_${pkgver}_x86_64.tar.zst::https://dl.lazycat.cloud/client/desktop/stable/lzc-client-desktop_v${pkgver}.tar.zst")
sha256sums_x86_64=('4a1a14bd73c41fd59250ef9d77da5dfcad7735019c6a8bfee851ba4090890d00')

package() {
    cd "${srcdir}"

    # Archive contents extract directly to srcdir (no top-level directory)
    install -dm755 "${pkgdir}/usr/lib/lzc-client-desktop"
    cp -a ./* "${pkgdir}/usr/lib/lzc-client-desktop/"

    # Wrapper in PATH
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/lzc-client-desktop" <<'EOF'
#!/bin/bash
exec /usr/lib/lzc-client-desktop/lzc-client-desktop "$@"
EOF

    # Desktop file: patch per-user paths to system locations
    install -Dm644 "${pkgdir}/usr/lib/lzc-client-desktop/lzc-client.desktop" \
        "${pkgdir}/usr/share/applications/lzc-client-desktop.desktop"
    sed -i \
        -e 's|^Exec=.*|Exec=/usr/bin/lzc-client-desktop %u|g' \
        -e 's|^Icon=.*|Icon=lzc-client-desktop|g' \
        "${pkgdir}/usr/share/applications/lzc-client-desktop.desktop"

    # Icon
    install -Dm644 "${pkgdir}/usr/lib/lzc-client-desktop/icon.png" \
        "${pkgdir}/usr/share/pixmaps/lzc-client-desktop.png"

    # polkit policy: point at the packaged setcap helper
    sed -i 's|__SETCAP_SCRIPT_PATH__|/usr/lib/lzc-client-desktop/core/linux_setcap.sh|g' \
        "${pkgdir}/usr/lib/lzc-client-desktop/cloud.lazycat.client.policy"
    install -Dm644 "${pkgdir}/usr/lib/lzc-client-desktop/cloud.lazycat.client.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/cloud.lazycat.client.policy"

    # License
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Proprietary software from Lazy Cat (lazycat.cloud)
License terms available at: https://lazycat.cloud/
EOF

    # Remove files installed to their proper system locations
    rm -f "${pkgdir}/usr/lib/lzc-client-desktop/lzc-client.desktop" \
          "${pkgdir}/usr/lib/lzc-client-desktop/cloud.lazycat.client.policy"

    # chrome-sandbox needs setuid for Electron
    chmod 4755 "${pkgdir}/usr/lib/lzc-client-desktop/chrome-sandbox"

    # Prevent the app from self-modifying capabilities via pacman-owned files
    rm -f "${pkgdir}/usr/lib/lzc-client-desktop/set-capabilities.sh"
}
