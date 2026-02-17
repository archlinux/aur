# Maintainer: Your Name <your.email@example.com>
pkgname=sealantern
pkgver=0.6.0
pkgrel=1
pkgdesc="一个轻量化的 Minecraft 服务器管理工具，基于 Tauri 2 + Rust + Vue 3 开发"
arch=('x86_64')
url="https://github.com/FPSZ/SeaLantern"
license=('GPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install

# 只保留 x86_64 架构
source=("sealantern.desktop")
source_x86_64=("${url}/releases/download/sea-lantern-v${pkgver}/Sea.Lantern_${pkgver}_amd64.AppImage")

sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')

package() {
    cd "${srcdir}"
    
    # 查找 AppImage 文件
    APPIMAGE=$(find . -maxdepth 1 -name "*.AppImage" -o -name "*.appimage" | head -1)
    
    if [[ -z "$APPIMAGE" ]]; then
        echo "错误：找不到 AppImage 文件"
        ls -la
        exit 1
    fi
    
    echo "找到 AppImage: $APPIMAGE"
    
    # 创建必要的目录结构
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    
    # 复制 AppImage 到 /usr/bin
    install -Dm755 "$APPIMAGE" "${pkgdir}/usr/bin/sealantern"
    
    # 复制 .desktop 文件
    install -Dm644 "${srcdir}/sealantern.desktop" "${pkgdir}/usr/share/applications/sealantern.desktop"
    
    # 尝试提取图标（如果 AppImage 支持）
    # 设置临时目录
    TMP_DIR="${srcdir}/squashfs-root"
    
    # 尝试提取 AppImage
    if [[ -x "$APPIMAGE" ]]; then
        chmod +x "$APPIMAGE"
        
        # 尝试提取 AppImage 内容
        "$APPIMAGE" --appimage-extract >/dev/null 2>&1 || true
        
        # 如果提取成功，查找图标
        if [[ -d "squashfs-root" ]]; then
            echo "从 AppImage 提取图标..."
            
            # 查找 .desktop 文件
            DESKTOP_FILE=$(find squashfs-root -name "*.desktop" | head -1)
            if [[ -n "$DESKTOP_FILE" ]]; then
                # 使用提取的 .desktop 文件（如果需要）
                echo "找到提取的 .desktop 文件: $DESKTOP_FILE"
            fi
            
            # 查找图标
            ICON_FILE=$(find squashfs-root -name "*.png" -o -name "*.svg" | head -5 | while read icon; do
                if file "$icon" | grep -q "PNG\|SVG"; then
                    echo "$icon"
                    break
                fi
            done)
            
            if [[ -n "$ICON_FILE" ]]; then
                echo "找到图标: $ICON_FILE"
                install -Dm644 "$ICON_FILE" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/sealantern.png"
                install -Dm644 "$ICON_FILE" "${pkgdir}/usr/share/pixmaps/sealantern.png"
            fi
        fi
    fi
    
    # 如果找不到图标，使用默认图标或创建占位符
    if [[ ! -f "${pkgdir}/usr/share/icons/hicolor/128x128/apps/sealantern.png" ]]; then
        echo "警告：未找到图标文件"
    fi
    
    echo "========================================="
    echo "安装完成！安装的文件："
    echo "========================================="
    echo "可执行文件："
    ls -la "${pkgdir}/usr/bin/" 2>/dev/null
    echo ""
    echo "Desktop 文件："
    ls -la "${pkgdir}/usr/share/applications/" 2>/dev/null
    echo ""
    echo "图标文件："
    ls -la "${pkgdir}/usr/share/icons/hicolor/"*/apps/ 2>/dev/null || echo "未找到"
    echo "========================================="
}