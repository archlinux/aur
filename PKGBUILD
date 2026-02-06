# Maintainer: Display-HDMI <wjr2009945@163.com>
pkgname=ceru-music-appimage
_pkgname=Ceru-Music               # 用于 .desktop 文件和内部引用
pkgver=1.8.1                      # AppImage 版本号，请与 GitHub Release 保持一致
pkgrel=1
pkgdesc="Ceru Music 是一个跨平台音乐播放器，支持获取公开音乐信息和基于插件的播放功能。"
arch=('x86_64')                   # AppImage 通常是 x86_64
url="https://ceru.docs.shiqianjiang.cn/"
license=('AGPL-3.0-only')              # 根据实际软件许可证修改，比如 'MIT', 'GPL3', 'AGPL-3.0'
depends=('zlib' 'fuse2')          # AppImage 通常需要 fuse2 来挂载
provides=("${_pkgname,,}")        # 提供 ceru-music
conflicts=("${_pkgname,,}")       # 与 ceru-music 冲突
options=(!strip)                  # 不要 strip AppImage 中的二进制符号

# 下载来源：Ceru Music 的 GitHub Release 页面
# 注意：请根据实际发布的文件名修改，比如 ceru-music-x.x.x-linux-x86_64.AppImage
source_x86_64=(
    "ceru-music-${pkgver}-linux-x86_64.AppImage::https://github.com/timeshiftsauce/CeruMusic/releases/download/v${pkgver}/ceru-music-${pkgver}-linux-x86_64.AppImage"
)

# SHA256 校验和（建议填写真实值，“SKIP” 仅用于测试）
# 获取方式：下载后运行 `sha256sum ceru-music-1.8.0-linux-x86_64.AppImage`
sha256sums_x86_64=('83bef1f0a1acd3b2793b92cf66f13adbbe14aba8aea98250fd71c78565ef43e5')        # 替换为真实 SHA256 值以通过校验

prepare() {
    # 赋予 AppImage 可执行权限
    chmod +x "${srcdir}/ceru-music-${pkgver}-linux-x86_64.AppImage"
}

package() {
    cd "$srcdir"

    # 1. 安装 AppImage 到 /opt/Ceru-Music/
    install -Dm755 "ceru-music-${pkgver}-linux-x86_64.AppImage" \
        "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # 2. 创建启动脚本 /usr/bin/ceru-music，用于直接运行 AppImage（不使用符号链接）
    mkdir -p "${pkgdir}/usr/bin"

    cat > "${pkgdir}/usr/bin/ceru-music" << 'EOF'
#!/bin/bash

# 可选：检查 fuse2 是否安装，提醒用户
if ! command -v fuse2 >/dev/null 2>&1; then
  echo "警告：未检测到 fuse2，某些功能可能受限。建议安装 fuse2。"
  echo "在 Arch Linux 上可以运行：sudo pacman -S fuse2"
fi

# 启动 Ceru Music AppImage
exec "/opt/Ceru-Music/Ceru-Music.AppImage" "$@"
EOF

    # 添加可执行权限
    chmod +x "${pkgdir}/usr/bin/ceru-music"

    # 3. 提取 AppImage 中的图标（通常位于 squashfs-root/usr/share/icons/...）
    "./ceru-music-${pkgver}-linux-x86_64.AppImage" --appimage-extract

    # 尝试查找并安装 512x512 或 256x256 分辨率的图标
    if [ -f "squashfs-root/usr/share/icons/hicolor/512x512/apps/ceru-music.png" ]; then
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/ceru-music.png" \
            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    elif [ -f "squashfs-root/usr/share/icons/hicolor/256x256/apps/ceru-music.png" ]; then
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/ceru-music.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    else
        echo "未找到标准分辨率的 ceru-music.png 图标，尝试查找其他可能路径..."
        # 通用查找（查找任意 png 图标，优先在 hicolor 目录）
        find squashfs-root -type f \( -iname "*.png" -o -iname "*.svg" \) | grep -i "icon" | head -n 1 | while read -r iconpath; do
            install -Dm644 "$iconpath" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
            echo "已安装找到的图标：$iconpath"
            break
        done
    fi

    # 4. 清理临时解压目录
    rm -rf squashfs-root/

    # 5. 创建 .desktop 桌面入口文件，使应用出现在应用菜单中
    mkdir -p "${pkgdir}/usr/share/applications"

    cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << EOF
[Desktop Entry]
Name[zh_CN]=澜音
Name=Ceru Music
GenericName=Music Player
Comment=${pkgdesc}
Exec=ceru-music
Icon=${_pkgname}
Type=Application
Categories=Audio;Music;AudioVideo;
StartupNotify=true
EOF

    # 6. （可选）安装一个 512x512 的图标到 /usr/share/pixmaps/（某些场景可能需要）
    if [ -f "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" ]; then
        install -Dm644 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    fi
}
