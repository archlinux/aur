# Maintainer: Display-HDMI <wjr2009945@163.com>
pkgname=ceru-music-bin
pkgver=2.2.0
pkgrel=5
pkgdesc='澜音 - 一款简洁优雅的跨平台音乐播放器，支持获取公开音乐信息和基于插件的播放功能。'
arch=('x86_64')
url='https://ceru.docs.shiqianjiang.cn/'
license=('AGPL-3.0-only')
# 使用系统 electron，不自带运行时。deb bundle 的是 Electron 44.4.3，
# Arch electron44 为 44.5.1，同 major（NODE_MODULE_VERSION 均为 149），
# 原生模块 ABI 一致。electron/electron44 已负责 gtk3、nss、alsa、avahi、
# cups、cairo、pango、wayland、x11、mesa、systemd-libs 等基础依赖。
depends=(
    'electron44'           # 提供 /usr/bin/electron 与 electron44 运行时
    'at-spi2-core'       # 无障碍支持
    'libnotify'          # 桌面通知
    'libsecret'          # safeStorage / 钥匙环
    'libxss'             # 休眠时抑制屏幕保护
    'libxtst'            # XI2 手势
    'xdg-utils'          # xdg-open / xdg-settings
)
optdepends=('libayatana-appindicator: 托盘图标支持')
provides=('ceru-music')
conflicts=('ceru-music-appimage')

_appdir='/usr/lib/ceru-music'
_debname="ceru-music-${pkgver}-linux-amd64.deb"
_debdir='澜音'         # 上游 deb 内部目录名（中文）

source=("LICENSE::https://raw.githubusercontent.com/timeshiftsauce/CeruMusic/main/LICENSE")
source_x86_64=("${_debname}::https://github.com/timeshiftsauce/CeruMusic/releases/download/v${pkgver}/${_debname}")
sha256sums=('156192fbbc7e97514fc250480ed4bd1570f1a7f6e59420b088b4151a7e68431b')
sha256sums_x86_64=('50df31c3284b06369cbdb4402ec7e879eff4af0c3056dcb3d17b598ec78f9b3f')

prepare() {
    # 只解出 app.asar 与 app.asar.unpacked，跳过 218MB 的 electron 二进制、
    # .pak、locales、v8/icu 快照等运行时文件（全部由 electron44 提供）
    mkdir -p "${srcdir}/debroot"
    bsdtar -xOf "${srcdir}/${_debname}" data.tar.xz \
        | bsdtar -x -C "${srcdir}/debroot" \
            "./opt/${_debdir}/resources/app.asar" \
            "./opt/${_debdir}/resources/app.asar.unpacked"

    # better-sqlite3 按 platform+arch 从 prebuilds/ 解析 .node，Arch(glibc,
    # x86_64) 只会用到 linux-x64.node，其余 7 个（win32/darwin/arm64/musl）
    # 共约 14 MiB 永远用不到
    local prebuilds="${srcdir}/debroot/opt/${_debdir}/resources/app.asar.unpacked/node_modules/better-sqlite3/prebuilds"
    find "$prebuilds" -type f -name '*.node' ! -name 'linux-x64.node' -delete

    # 明确不安装的资源及原因：
    #   app-update.yml  —— 自更新源指向 generic HTTP（update.cerumusic.top），
    #                      版本交给 pacman 管理，否则应用会覆盖包管理器文件
    #   package-type    —— 内容为 "deb" 会让 electron-updater 走 DebUpdater
    #                      并调用 dpkg；文件缺失时它会安全回退到
    #                      AppImageUpdater，因此不装
}

package() {
    # 1. 应用代码（app.asar + 解包出来的原生模块 better-sqlite3、资源文件）
    install -d "${pkgdir}${_appdir}/resources"
    cp -a "${srcdir}/debroot/opt/${_debdir}/resources/app.asar" \
        "${pkgdir}${_appdir}/resources/"
    cp -a "${srcdir}/debroot/opt/${_debdir}/resources/app.asar.unpacked" \
        "${pkgdir}${_appdir}/resources/"

    # 2. 启动脚本：用系统 electron 加载 app.asar
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ceru-music" << EOF
#!/bin/bash
exec /usr/bin/electron44 ${_appdir}/resources/app.asar "\$@"
EOF

    # 3. 图标：deb 自带 16~1024 全套 hicolor 图标
    for size in 16 24 32 48 64 128 256 512 1024; do
        local icon="${srcdir}/debroot/opt/${_debdir}/resources/app.asar.unpacked/resources/icons/${size}x${size}.png"
        [ -f "$icon" ] && install -Dm644 "$icon" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/ceru-music.png"
    done

    # 4. 桌面入口
    # 注意 StartupWMClass 用 ceru-music 而非上游 deb 写的「澜音」：
    # WM_CLASS 取自 app.asar 内 package.json 的 name 字段，实测为 ceru-music
    #
    # 关于 Name 的本地化：GLib 实测发现只写 Name[en] 无效——en_US/en_GB/
    # en_AU/C.UTF-8 全部回退到无后缀的 Name=，英文环境搜不到。
    # 原因是没有 zh_CN 变体时，中文 locale 与英文 locale 都落到默认值。
    # 故补 Name[zh_CN]（本项目主语言）并加 Keywords 兜底，
    # 让 fuzzel/rofi/gnome 在中英文环境都能搜到。
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/ceru-music.desktop" << EOF
[Desktop Entry]
Name=澜音
Name[zh_CN]=澜音
Name[zh]=澜音
Name[en]=Ceru Music
Name[en_US]=Ceru Music
Name[en_GB]=Ceru Music
GenericName=Music Player
GenericName[zh_CN]=音乐播放器
Comment=${pkgdesc}
Keywords=ceru;cerumusic;music;audio;player;sound;音乐;播放器;音源;歌曲;
Exec=ceru-music %U
Icon=ceru-music
Terminal=false
Type=Application
StartupNotify=true
StartupWMClass=ceru-music
Categories=Audio;Music;AudioVideo;
MimeType=audio/mpeg;audio/mp3;audio/x-mp3;audio/flac;audio/x-flac;audio/ogg;audio/x-vorbis+ogg;audio/x-wav;audio/mp4;audio/aac;audio/x-matroska;
EOF

    # 5. ceru-music:// 深度链接处理器
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/ceru-music-scheme-handler.desktop" << EOF
[Desktop Entry]
Name=澜音
Name[en]=Ceru Music
Comment=Open ceru-music:// links
Exec=ceru-music %u
Icon=ceru-music
Type=Application
Terminal=false
NoDisplay=true
Categories=Audio;Music;
MimeType=x-scheme-handler/ceru-music;x-scheme-handler/cerumusic;
EOF

    # 6. .ceru / .ceru-music 项目文件关联
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/mime/packages/ceru-music.xml" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-ceru-music">
    <comment>Ceru Music project file</comment>
    <glob pattern="*.ceru"/>
    <glob pattern="*.ceru-music"/>
  </mime-type>
</mime-info>
EOF

    # 7. AppStream 元数据（上游未提供）
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/metainfo/ceru-music.metainfo.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>ceru-music.desktop</id>
  <metadata_license>CC0-1.0</metadata_license>
  <project_license>AGPL-3.0-only</project_license>
  <name>澜音</name>
  <name xml:lang="en">Ceru Music</name>
  <summary>简洁优雅的音乐播放器</summary>
  <description>
    <p>澜音是一个跨平台音乐播放器，支持获取公开音乐信息和基于插件的播放功能。</p>
  </description>
  <launchable type="desktop-id">ceru-music.desktop</launchable>
  <url type="homepage">${url}</url>
  <url type="bugtracker">https://github.com/timeshiftsauce/CeruMusic/issues</url>
  <categories>
    <category>Audio</category>
    <category>Music</category>
    <category>AudioVideo</category>
  </categories>
  <provides>
    <binary>ceru-music</binary>
  </provides>
  <replaces>
    <id>ceru-music-appimage</id>
  </replaces>
  <supports>
    <mime-type>audio/mpeg</mime-type>
    <mime-type>audio/flac</mime-type>
    <mime-type>audio/ogg</mime-type>
    <mime-type>audio/x-wav</mime-type>
    <mime-type>audio/mp4</mime-type>
    <mime-type>application/x-ceru-music</mime-type>
  </supports>
</component>
EOF

    # 8. 许可证（electron 自身的许可证由 electron44 提供）
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
