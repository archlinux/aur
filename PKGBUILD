# Maintainer: Display-HDMI <wjr2009945@163.com>
pkgname=ceru-music-bin
pkgver=2.4.0
pkgrel=6
pkgdesc='澜音 - 一款简洁优雅的跨平台音乐播放器，支持获取公开音乐信息和基于插件的播放功能。'
arch=('x86_64')
url='https://ceru.docs.shiqianjiang.cn/'
license=('AGPL-3.0-only')
# 使用系统 electron，不自带运行时。deb bundle 的是 Electron 44.4.3，
# Arch electron44 为 44.5.1，同 major（NODE_MODULE_VERSION 均为 149），
# 原生模块 ABI 一致。electron/electron44 已负责 gtk3、nss、alsa、avahi、
# cups、cairo、pango、wayland、x11、mesa、systemd-libs 等基础依赖。
#
# MPRIS：上游原生模块 external-media-integration 有 bug ——
# sys_media/linux.rs 的 run_mpris_worker() 从不 await player.run()，
# mpris-server 0.10 的 object server 无人驱动，客户端第一条查询即 panic
# （local_server.rs:123, SendError unwrap），接口永远超时；上游修复前用不了。
#   另外上游无条件 appendSwitch("disable-features",
#   "HardwareMediaKeyHandling,MediaSessionService")，把 Chromium 自带的
#   mediaSession/MPRIS 集成也禁用了（"降级为浏览器方案"沦为死代码，
#   且实测禁用 HardwareMediaKeyHandling 会连坐 MediaSessionService，
#   二者必须同时释放）。
#   再有：主进程 close 事件 handler 不 preventDefault，窗口管理器发出的
#   关闭请求（任务栏关闭/高规 Alt+F4 之外的所有 WM 路径）直接销毁窗口并
#   触发 window-all-closed → 完全退出，closeToTray 设置对 WM 关闭无效。
# 补丁见 prepare()（等长字节替换，不破坏 asar 偏移；每处替换均做唯一性
# 与等长断言，上游结构变化时会清晰报错）。
# 上游修好后（issue 见 upstream-issue-draft.md，均已验证）：
#   1) run() 修复前不需要重编 .node，mediaSession 路线即完整可用（含封面）；
#   2) closeToTray/close bug 上游修复后移除 patch-asar.cjs 的对应补丁。
# 本仓库 native/ 保存上游开源原生模块源码 + run() 修复版，仅作 issue 佐证。
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
_debdir='澜音'

# 上游 bug（MPRIS 永远超时）：native/external-media-integration/src/sys_media/
# linux.rs 的 run_mpris_worker() 从不 await player.run()，mpris-server 0.10 的
# object server 无人驱动，客户端任何方法调用即触发 local_server.rs 内部
# unwrap(SendError) panic。本仓库 native/ 里保存了上游开源源码 + 已验证的
# 修复版（select! 驱动 run()），仅作参考与上游 issue 佐证，不参与本包构建。

source=("LICENSE::https://raw.githubusercontent.com/timeshiftsauce/CeruMusic/main/LICENSE")
source_x86_64=("${_debname}::https://github.com/timeshiftsauce/CeruMusic/releases/download/v${pkgver}/${_debname}")
sha256sums=('156192fbbc7e97514fc250480ed4bd1570f1a7f6e59420b088b4151a7e68431b')
sha256sums_x86_64=('6411c9d19b2dba2ba05ccbfe6fa0b29a8712bbd78f70a78eddb27c4bd5513a23')

prepare() {
    # 只解出 app.asar 与 app.asar.unpacked，跳过 218MB 的 electron 二进制、
    # .pak、locales、v8/icu 快照等运行时文件（全部由 electron44 提供）
    mkdir -p "${srcdir}/debroot"
    bsdtar -xOf "${srcdir}/${_debname}" data.tar.xz \
        | bsdtar -x -C "${srcdir}/debroot" \
            "./opt/${_debdir}/resources/app.asar" \
            "./opt/${_debdir}/resources/app.asar.unpacked"

    # 上游原生模块 external-media-integration 的 Linux MPRIS 有 bug（缺
    # player.run() 驱动，D-Bus 接口永远超时，见顶部注释），直接删掉，
    # 让 emi loader 走「未找到原生模块」分支，由 Chromium mediaSession 兜底。
    rm -rf "${srcdir}/debroot/opt/${_debdir}/resources/app.asar.unpacked/native"

    # 等长补丁 1 —— 释放 Chromium mediaSession / MPRIS：application 主进程
    # 无条件 appendSwitch("disable-features","HardwareMediaKeyHandling,
    # MediaSessionService")，把浏览器侧 mediaSession 集成（Linux 上即 MPRIS）
    # 整个禁掉（且实测仅禁用 HardwareMediaKeyHandling 也会连坐禁掉 MPRIS
    # 注册——Chromium 里二者耦合）。替换为同样长度的无效 feature 名，
    # feature 本身默认开启，无需再传开关。
    # 等长补丁 2 —— 修复「WM 关闭消息直接退出」：
    # 原 close handler 是 t.on("close",()=>{...;Q.get("closeToTray",!0)||e.app.quit()})，
    # 永不 preventDefault → WM/任务栏的关闭请求直接销毁窗口 →
    # window-all-closed → app.quit()，closeToTray 设置对 WM 关闭完全无效；
    # 修复后：before-quit 先置全局 qf=1（真实退出：托盘退出/更新安装/关机流
    # 程），close 事件在 qf 未置位时 preventDefault + hide（缩到托盘），已置位
    # 时放行正常销毁退出；window-close IPC（关闭按钮选了"直接退出"的路径）
    # 改走 e.app.quit()，同样经 qf 放行。全部等长替换，不移动 asar 内偏移。
    # 上游修复（其 TODO 里本来就挂着「closeToTray 同步」）后可移除本补丁。
    cat > "${srcdir}/patch-asar.cjs" <<'EOF'
const fs = require('fs');
process.noAsar = true; // 绕过 Electron 的 asar-fs 拦截（否则读不到 .asar 本体）
const file = process.argv[2];
let d = fs.readFileSync(file);
const patches = [
  ['HardwareMediaKeyHandling,MediaSessionService',
   'UnusedFeatureHWKeysAAAAA,UnusedFeatureFALLBb'],
  ['e.ipcMain.on("window-close",()=>{t.close(),Hs.getWin()?.close()}),t.on("close",()=>{Hs.getWin()?.close();Q.get("closeToTray",!0)||e.app.quit()})',
   'e.ipcMain.on("window-close",()=>{e.app.quit()}),t.on("close",r=>{Q.get("closeToTray",1)?global.qf?0:(r.preventDefault(),t.hide()):e.app.quit()})'],
  ['e.app.on("before-quit",()=>{Ar.disposeAll().catch(()=>{}),Cs.flushCacheIndex().catch(()=>{})})',
   'e.app.on("before-quit",()=>{global.qf=1,Ar.disposeAll(),Cs.flushCacheIndex()' + ' '.repeat(16) + '})'],
];
for (const [o, n] of patches) {
  const ob = Buffer.from(o), nb = Buffer.from(n);
  if (ob.length !== nb.length) { console.error('不等长: ' + o.slice(0, 40)); process.exit(1); }
  const i = d.indexOf(ob);
  if (i < 0) { console.error('未找到目标（上游结构变了？）: ' + o.slice(0, 60)); process.exit(1); }
  try { new Function(n) } catch (e) { console.error('替换片段语法错误: ' + e.message); process.exit(1) }
  d = Buffer.concat([d.slice(0, i), nb, d.slice(i + ob.length)]);
}
fs.writeFileSync(file, d);
console.log('app.asar 补丁完成');
EOF
    ELECTRON_RUN_AS_NODE=1 /usr/bin/electron44 "${srcdir}/patch-asar.cjs" \
        "${srcdir}/debroot/opt/${_debdir}/resources/app.asar" \
        || { echo 'app.asar 补丁失败'; return 1; }

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
    # 1. 应用代码（足够 asar + 解包模块 better-sqlite3、资源文件）
    install -d "${pkgdir}${_appdir}/resources"
    cp -a "${srcdir}/debroot/opt/${_debdir}/resources/app.asar" \
        "${pkgdir}${_appdir}/resources/"
    cp -a "${srcdir}/debroot/opt/${_debdir}/resources/app.asar.unpacked" \
        "${pkgdir}${_appdir}/resources/"

    # 1.5 原生模块 external-media-integration（Linux MPRIS bug，见顶部注释）
    #     已在 prepare() 删除；app.asar 补丁使 Chromium mediaSession 兜底生效。

    # 2. 启动脚本：用系统 electron 加载 app.asar
    #    启动前读取用户自定义参数文件（约定同 code-flags.conf / electron-flags.conf）：
    #      ${XDG_CONFIG_HOME:-$HOME/.config}/ceru-music-flags.conf
    #    每行一个参数，空行与 # 开头的整行注释忽略。
    #    注意参数必须插在 app.asar 之前 —— Chromium/Electron 开关只有位于
    #    app 路径之前才会被 electron 本体识别；桌面入口与 ceru-music://
    #    深度链接传入的 "$@"（文件/URL）仍排在最后。
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ceru-music" << EOF
#!/bin/bash
_flags=()
_conf="\${XDG_CONFIG_HOME:-\$HOME/.config}/ceru-music-flags.conf"
if [ -r "\$_conf" ]; then
    while IFS= read -r _line || [ -n "\$_line" ]; do
        # 去掉行首尾空白（read 按默认 IFS 折叠），允许手写缩进
        read -r _line <<< "\$_line"
        [ -z "\$_line" ] && continue
        case "\$_line" in '#'*) continue ;; esac
        _flags+=("\$_line")
    done < "\$_conf"
fi
exec /usr/bin/electron44 "\${_flags[@]}" ${_appdir}/resources/app.asar "\$@"
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
    # 关于 Name 的本地化：GLib 在无匹配 locale 变体时会回退到无后缀的
    # Name=，故默认值用英文（Ceru Music），中文 locale 再补
    # Name[zh_CN]/Name[zh]=澜音。只写 Name[en] 是无效的
    # （en_US/en_GB/C.UTF-8 等都会落到默认值），因此不再单独写英文变体。
    # 另加 Keywords 兜底，让 fuzzel/rofi/gnome 在中英文环境都能搜到。
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/ceru-music.desktop" << EOF
[Desktop Entry]
Name=Ceru Music
Name[zh_CN]=澜音
Name[zh]=澜音
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
Name=Ceru Music
Name[zh_CN]=澜音
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
