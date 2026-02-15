# Maintainer: DBeidachazi <a269502169@gmail.com>
pkgname=apifox-appimage
pkgver=2.8.8
pkgrel=1
pkgdesc="Apifox - API documentation, debugging, mocking, and testing tool (AppImage in Zip) API 文档、API 调试、API Mock、API 自动化测试"
arch=('x86_64')
url="https://apifox.com"
license=('Proprietary')
# AppImage 运行通常依赖 fuse2，图形界面依赖标准库
depends=('fuse2' 'zlib' 'hicolor-icon-theme' 'desktop-file-utils') 
conflicts=('apifox' 'apifox-bin' 'apifox-appimage')
provides=('apifox')
options=('!strip')

# 使用官方 latest 链接
source=("Apifox-linux-${pkgver}.zip::https://file-assets.apifox.com/download/Apifox-linux-latest.zip")
# 跳过校验，因为 latest 文件内容会变
sha256sums=('SKIP') 

prepare() {
    # 1. 自动解压后，我们需要找到那个 AppImage 文件
    # 因为文件名可能带版本号也可能不带，我们用通配符找
    local _appimage=$(find . -maxdepth 1 -name "*.AppImage" -print -quit)
    
    if [ -z "$_appimage" ]; then
        echo "错误：在 Zip 包中未找到 .AppImage 文件！"
        exit 1
    fi

    echo "找到 AppImage 文件: $_appimage"
    
    # 2. 赋予执行权限
    chmod +x "$_appimage"

    # 3. 从 AppImage 中提取 .desktop 文件和图标
    # 这一步是为了让你的开始菜单能显示图标
    ./"$_appimage" --appimage-extract "apifox.desktop"
    ./"$_appimage" --appimage-extract "usr/share/icons/hicolor/512x512/apps/apifox.png"
    
    # 为了方便 package() 阶段调用，重命名一下
    mv "$_appimage" "apifox.AppImage"
}

package() {
    # 1. 安装 AppImage 主程序到 /opt/apifox
    install -Dm755 "apifox.AppImage" "${pkgdir}/opt/${pkgname}/apifox.AppImage"

    # 2. 创建启动脚本到 /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    echo -e '#!/bin/sh\nexec /opt/'"${pkgname}"'/apifox.AppImage "$@"' > "${pkgdir}/usr/bin/apifox"
    chmod +x "${pkgdir}/usr/bin/apifox"

    # 3. 安装之前提取出来的 .desktop 文件
    install -Dm644 "squashfs-root/apifox.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # 4. 修正 .desktop 文件内容
    # 把 Exec 指向我们创建的 /usr/bin/apifox
    sed -i "s|^Exec=.*|Exec=apifox %U|" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # 修正图标名称
    sed -i "s|^Icon=.*|Icon=apifox|" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # 5. 安装图标
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/apifox.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/apifox.png"
}
