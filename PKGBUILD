# Maintainer: comalot <joegodwanggod@gmail.com>
# 純官方來源的 FlClash PKGBUILD - 使用 AppImage (100% from official GitHub)

pkgname=flclash-appimage-bin
_pkgname=FlClash
pkgver=0.8.91
pkgrel=1
pkgdesc="A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free"
arch=('x86_64')
url="https://github.com/chen08209/FlClash"
license=('GPL-3.0-only')
depends=('fuse2' 'hicolor-icon-theme')
optdepends=(
    'libayatana-appindicator: system tray support'
    'libkeybinder3: global hotkey support'
)
provides=('flclash')
conflicts=('flclash' 'flclash-bin')
options=('!strip')

# 來源 100% 來自官方 GitHub
source_x86_64=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.AppImage")
sha256sums_x86_64=('fdb76b7d9c1b40a434923f16b92db96d6843f6ab8e360fd8b6d0a35b5dff5738')

prepare() {
    chmod +x "${srcdir}/${_pkgname}-${pkgver}.AppImage"

    # 解壓 AppImage 取得圖示和 desktop 檔案
    cd "${srcdir}"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null 2>&1 || true
}

package() {
    # 安裝 AppImage 主程式
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

    # 建立執行連結
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/flclash"

    # 安裝圖示 (從解壓的 AppImage 取得)
    if [[ -d "${srcdir}/squashfs-root" ]]; then
        # 尋找圖示
        for size in 16 32 48 64 128 256 512; do
            icon_file=$(find "${srcdir}/squashfs-root" -name "*.png" -path "*${size}*" 2>/dev/null | head -1)
            if [[ -f "$icon_file" ]]; then
                install -Dm644 "$icon_file" \
                    "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/flclash.png"
            fi
        done

        # 如果沒找到特定尺寸，用主圖示
        main_icon=$(find "${srcdir}/squashfs-root" -maxdepth 1 -name "*.png" 2>/dev/null | head -1)
        if [[ -f "$main_icon" ]]; then
            install -Dm644 "$main_icon" \
                "${pkgdir}/usr/share/icons/hicolor/256x256/apps/flclash.png"
        fi
    fi

    # 建立 desktop 檔案
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/flclash.desktop" <<EOF
[Desktop Entry]
Name=FlClash
Comment=A multi-platform proxy client based on ClashMeta
Exec=flclash %U
Icon=flclash
Terminal=false
Type=Application
Categories=Network;
StartupWMClass=com.follow.clash
Keywords=proxy;clash;vpn;
EOF
}
