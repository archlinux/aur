# Maintainer: syhanjin <syhanjin666@gmail.com>

pkgname=ocs-desktop-bin
pkgver=2.8.21
pkgrel=1
pkgdesc="OCS Desktop"
arch=('x86_64' 'aarch64')
url="https://docs.ocsjs.com"
license=('MIT')
depends=(
  'glib2' 'pango' 'cairo' 'nss' 'nspr'
  'libx11' 'libxext' 'libxrandr' 'libxfixes' 'libxcomposite'
  'libxdamage' 'libxcb' 'libxkbcommon' 'mesa' 'alsa-lib'
  'libcups' 'at-spi2-core' 'dbus' 'systemd-libs'
  'expat' 'hicolor-icon-theme'
)
makedepends=('fuse2' 'libarchive')
provides=('ocs-desktop')
conflicts=('ocs-desktop')
options=(!strip)

source_x86_64=("ocs-${pkgver}-setup-linux-x86_64.AppImage::https://github.com/ocsjs/ocs-desktop/releases/download/${pkgver}/ocs-${pkgver}-setup-linux-x86_64.AppImage")
source_aarch64=("ocs-${pkgver}-setup-linux-arm64.AppImage::https://github.com/ocsjs/ocs-desktop/releases/download/${pkgver}/ocs-${pkgver}-setup-linux-arm64.AppImage")

noextract=("ocs-${pkgver}-setup-linux-x86_64.AppImage" "ocs-${pkgver}-setup-linux-arm64.AppImage")

sha256sums_x86_64=('daefbc4e672b8b3fa32d70165dca89c9cfc0574316e7be0a8b1d816a36341add')
sha256sums_aarch64=('c850564ddfa87a7796ff3111f2c65c093f1c198446b053a1ac68232d803279e3')

package() {
    if [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/ocs-${pkgver}-setup-linux-arm64.AppImage" \
            "${pkgdir}/opt/ocs-desktop/OCS-Desktop.AppImage"
        chmod +x "${srcdir}/ocs-${pkgver}-setup-linux-arm64.AppImage"
        "${srcdir}/ocs-${pkgver}-setup-linux-arm64.AppImage" --appimage-extract
    else
        install -Dm755 "${srcdir}/ocs-${pkgver}-setup-linux-x86_64.AppImage" \
            "${pkgdir}/opt/ocs-desktop/OCS-Desktop.AppImage"
        chmod +x "${srcdir}/ocs-${pkgver}-setup-linux-x86_64.AppImage"
        "${srcdir}/ocs-${pkgver}-setup-linux-x86_64.AppImage" --appimage-extract
    fi

    # 提取 Chrome 资源
    mkdir -p "${pkgdir}/opt/ocs-desktop/resources/bin/chrome/chrome"
    bsdtar -xf "./squashfs-root/resources/bin/chrome/chrome.zip" \
        --strip-components=2 \
        -C "${pkgdir}/opt/ocs-desktop/resources/bin/chrome/chrome"
    chmod -R +x "${pkgdir}/opt/ocs-desktop/resources/bin/chrome/chrome"

    # 图标
    install -Dm644 "./squashfs-root/usr/share/icons/hicolor/0x0/apps/ocs desktop.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ocs-desktop.png"

    rm -rf ./squashfs-root

    # 启动脚本
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ocs-desktop" <<'EOF'
#!/bin/bash
exec /opt/ocs-desktop/OCS-Desktop.AppImage --no-sandbox "$@"
EOF


    # 桌面入口
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/OCS Desktop.desktop" <<'EOF'
[Desktop Entry]
Name=OCS Desktop
Exec=ocs-desktop
Icon=ocs-desktop
Terminal=false
Type=Application
Categories=Utility;
Comment=OCS 浏览器自动化神器，一键浏览器多开，用户脚本环境一键配置.
StartupWMClass=OCS Desktop
EOF

    # 提示信息
    echo
    echo "=================================================================="
    echo "OCS Desktop 需要的 Chrome 将被安装在"
    echo "    /opt/ocs-desktop/resources/bin/chrome/chrome/chrome"
    echo "请在 OCS Desktop 中使用该路径进行浏览器配置"
    echo "=================================================================="
    echo

    rm -rf "${pkgdir}/usr/src/debug" || true
}
