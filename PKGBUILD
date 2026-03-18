# Maintainer: Display-HDMI <wjr2009945@163.com>
pkgname=ceru-music-appimage
_pkgname=Ceru-Music               # 用于 .desktop 文件和内部引用
pkgver=1.9.6                      # AppImage 版本号，请与 GitHub Release 保持一致
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
sha256sums_x86_64=('7fca86c35cd23b6731f57e0fc29208a7464d75b3603552e994a3ee49777c4a20')        # 替换为真实 SHA256 值以通过校验

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
Exec=ceru-music %u
Icon=${_pkgname}
Type=Application
Categories=Audio;Music;AudioVideo;
StartupNotify=true
MimeType=audio/mpeg;audio/mp3;audio/x-mp3;audio/mpeg3;audio/x-mpeg3;audio/mpg;audio/x-mpg;audio/x-mpegaudio;audio/x-flac;audio/flac;audio/x-vorbis+ogg;audio/ogg;application/ogg;audio/x-wav;audio/wav;audio/x-ms-wma;audio/x-matroska;audio/x-musepack;audio/mp4;audio/aac;audio/vnd.dlna.adts;
EOF

    # 6. （可选）安装一个 512x512 的图标到 /usr/share/pixmaps/（某些场景可能需要）
    if [ -f "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" ]; then
        install -Dm644 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    fi

    # 7. 安装 URL scheme 处理器（支持自定义协议 ceru-music://）
    cat > "${pkgdir}/usr/share/applications/${_pkgname}-scheme-handler.desktop" << EOF
[Desktop Entry]
Name[zh_CN]=澜音
Name=Ceru Music
Comment=Open ceru-music:// links
Exec=ceru-music %u
Icon=${_pkgname}
Type=Application
Terminal=false
NoDisplay=true
Categories=Audio;Music;
MimeType=x-scheme-handler/ceru-music;x-scheme-handler/cerumusic;
EOF

    # 8. 创建 MIME 类型关联配置文件
    mkdir -p "${pkgdir}/usr/share/mime/packages"
    cat > "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-ceru-music">
    <comment>Ceru Music project file</comment>
    <glob pattern="*.ceru"/>
    <glob pattern="*.ceru-music"/>
  </mime-type>
</mime-info>
EOF

    # 9. 创建应用信息文件（用于 open-xdg）
    mkdir -p "${pkgdir}/usr/share/appdata"
    cat > "${pkgdir}/usr/share/appdata/${_pkgname}.appdata.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>${_pkgname}.desktop</id>
  <name>Ceru Music</name>
  <name xml:lang="zh_CN">澜音</name>
  <summary>跨平台音乐播放器</summary>
  <description>
    <p>Ceru Music 是一个跨平台音乐播放器，支持获取公开音乐信息和基于插件的播放功能。</p>
  </description>
  <launchable type="desktop-id">${_pkgname}.desktop</launchable>
  <url type="homepage">${url}</url>
  <url type="bugtracker">https://github.com/timeshiftsauce/CeruMusic/issues</url>
  <project_license>AGPL-3.0-only</project_license>
  <categories>
    <category>Audio</category>
    <category>Music</category>
    <category>AudioVideo</category>
  </categories>
  <provides>
    <binary>ceru-music</binary>
  </provides>
  <supports>
    <mime-type>audio/mpeg</mime-type>
    <mime-type>audio/flac</mime-type>
    <mime-type>audio/ogg</mime-type>
    <mime-type>audio/wav</mime-type>
    <mime-type>audio/mp4</mime-type>
    <mime-type>application/x-ceru-music</mime-type>
  </supports>
</component>
EOF

    # 10. 创建安装后脚本用于注册深度链接
    mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
    cat > "${pkgdir}/usr/lib/${_pkgname}/register-mime.sh" << 'EOF'
#!/bin/bash
# 注册 MIME 类型和深度链接（需要 root 权限）

# 检查是否有 root 权限
if [ "$(id -u)" -ne 0 ]; then
    echo "警告：更新 MIME 数据库需要 root 权限"
    echo "请手动运行：sudo /usr/lib/ceru-music-appimage/register-mime.sh"
    exit 0
fi

# 更新 MIME 数据库
if [ -x "$(command -v update-mime-database)" ]; then
    update-mime-database /usr/share/mime > /dev/null 2>&1
fi

# 更新桌面数据库
if [ -x "$(command -v update-desktop-database)" ]; then
    update-desktop-database /usr/share/applications > /dev/null 2>&1
fi

# 更新图标缓存
if [ -x "$(command -v gtk-update-icon-cache)" ]; then
    gtk-update-icon-cache -f -t /usr/share/icons/hicolor > /dev/null 2>&1
fi

echo "Ceru Music 深度链接已注册完成"
EOF

    chmod +x "${pkgdir}/usr/lib/${_pkgname}/register-mime.sh"

    # 11. 创建卸载脚本
    cat > "${pkgdir}/usr/lib/${_pkgname}/unregister-mime.sh" << 'EOF'
#!/bin/bash
# 注销 MIME 类型和深度链接（需要 root 权限）

# 检查是否有 root 权限
if [ "$(id -u)" -ne 0 ]; then
    echo "警告：更新数据库需要 root 权限"
    exit 0
fi

# 强制更新桌面数据库
if [ -x "$(command -v update-desktop-database)" ]; then
    update-desktop-database /usr/share/applications > /dev/null 2>&1
fi

# 更新图标缓存
if [ -x "$(command -v gtk-update-icon-cache)" ]; then
    gtk-update-icon-cache -f -t /usr/share/icons/hicolor > /dev/null 2>&1
fi

echo "Ceru Music 深度链接已注销"
EOF

    chmod +x "${pkgdir}/usr/lib/${_pkgname}/unregister-mime.sh"

    # 12. 创建 xdg-open 工具脚本（用于统一打开资源）
    cat > "${pkgdir}/usr/bin/xdg-ceru-music" << 'EOF'
#!/bin/bash
# Ceru Music xdg-open wrapper
# 使用方式：xdg-ceru-music [文件/URL]

SCRIPT_DIR="/usr/lib/ceru-music-appimage"

# 如果是首次运行，尝试注册 MIME 类型（仅提示）
if [ ! -f "$HOME/.local/share/applications/ceru-music-setup-done" ]; then
    echo "提示：如需完整深度链接支持，请运行：sudo /usr/lib/ceru-music-appimage/register-mime.sh"
    mkdir -p "$HOME/.local/share/applications"
    touch "$HOME/.local/share/applications/ceru-music-setup-done"
fi

# 传递所有参数给主程序
exec ceru-music "$@"
EOF

    chmod +x "${pkgdir}/usr/bin/xdg-ceru-music"
}
