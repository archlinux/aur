# Maintainer: fantasyzhjk <fantasyzhjk at aur dot archlinux dot org>
# Upstream: https://github.com/osuplusplus/OPP
#
# opp-bin：官方 GitHub Release deb 的重打包。AUR 只承载配方，
# 二进制始终来自 osuplusplus/OPP 的正式发布并按 sha256sums 校验。
# 发新版本时仅需更新 pkgver 与第一个 sha256sums（可由 .github/workflows/AUR.yml 代办）。

pkgname=opp-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='An all-in-one osu! toolkit'
url='https://github.com/osuplusplus/OPP'
license=(MIT)
arch=(x86_64)

depends=(
  'alsa-lib'                # cpal 本地音频（ALSA）
  'dbus'                    # MPRIS 媒体控制、Secret Service 通道
  'desktop-file-utils'      # 运行时注册 opp:// 深链的 update-desktop-database
  'gtk3'
  'hicolor-icon-theme'      # deb 内置 hicolor 图标
  'libayatana-appindicator' # 托盘（二进制按 ayatana soname 链接）
  'libx11'                  # live_render X11 原生子窗口（Wayland 会话经 XWayland）
  'webkit2gtk-4.1'          # Tauri/Wry 界面
  'xdg-utils'               # 深链注册 xdg-mime 与系统打开器
)
optdepends=(
  'ffmpeg: Danser 渲染、Trainer 与视频工具'
  'danser: 本地回放渲染后端'
  'tosu: 游戏内覆盖数据源（经 pkexec 提权启动）'
  'osu-lazer: osu! lazer 客户端'
  'osu-wine: Wine 下的 osu! Stable 客户端'
)
provides=(opp)
conflicts=(opp)

source=("https://github.com/osuplusplus/OPP/releases/download/v${pkgver}/OPP_${pkgver}_linux_amd64.deb"
        'LICENSE')
noextract=("OPP_${pkgver}_linux_amd64.deb")
sha256sums=('8a54248302f514e802ee91ba72ac76c47bd61e951a5788a24343beb556546ff1'
            '90e042cc6b2fdeb48c52142ffec83ce6f7706a664fef3bb11d65eb7a68d80039')

package() {
  cd "$srcdir"
  # deb 为 ar 归档：先解出 data.tar.gz（Tauri deb 恒为 gzip），再摊平进 pkgdir。
  # 内容为 usr/bin/opp、usr/share/applications/OPP.desktop 与 hicolor 图标，
  # desktop 文件已带 Exec=opp / Icon=opp / MimeType=x-scheme-handler/opp，无需修正。
  bsdtar -xf "OPP_${pkgver}_linux_amd64.deb"
  bsdtar -xf data.tar.gz -C "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
