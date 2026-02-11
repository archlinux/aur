# Maintainer: DBeidachazi <a269502169@gmail.com>
pkgname=chell-appimage
pkgver=0.2.2
pkgrel=1
pkgdesc="Chell - An integrated workspace for managing AI coding agents (Claude Code, Codex, Gemini, etc.)"
arch=('x86_64')
url="https://github.com/Cerulin/Chell"
license=('unknown')
depends=('fuse2' 'zlib' 'hicolor-icon-theme' 'desktop-file-utils')
conflicts=('chell' 'chell-bin' 'chell-appimage')
provides=('chell')
options=('!strip')

source=("chell-desktop-${pkgver}-x86_64.AppImage::https://github.com/Cerulin/Chell/releases/download/v${pkgver}/chell-desktop-x86_64.AppImage")
sha256sums=('a5141bee65242ed01c806d8bee09abc14c8d497ecc972533da465fcb69750f87')

prepare() {
    local _appimage="chell-desktop-${pkgver}-x86_64.AppImage"

    chmod +x "$_appimage"

    # 从 AppImage 中提取 .desktop 文件和图标
    ./"$_appimage" --appimage-extract "chell-desktop.desktop"
    ./"$_appimage" --appimage-extract "usr/share/icons/hicolor/1000x1000/apps/chell-desktop.png"

    mv "$_appimage" "chell.AppImage"
}

package() {
    # 1. 安装 AppImage 主程序到 /opt/chell
    install -Dm755 "chell.AppImage" "${pkgdir}/opt/${pkgname}/chell.AppImage"

    # 2. 创建启动脚本到 /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    echo -e '#!/bin/sh\nexec /opt/'"${pkgname}"'/chell.AppImage "$@"' > "${pkgdir}/usr/bin/chell"
    chmod +x "${pkgdir}/usr/bin/chell"

    # 3. 安装 .desktop 文件
    install -Dm644 "squashfs-root/chell-desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # 4. 修正 .desktop 文件内容
    sed -i "s|^Exec=.*|Exec=chell %U|" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    sed -i "s|^Icon=.*|Icon=chell-desktop|" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # 5. 安装图标
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/1000x1000/apps/chell-desktop.png" \
        "${pkgdir}/usr/share/icons/hicolor/1000x1000/apps/chell-desktop.png"
}
