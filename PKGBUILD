# Maintainer: fantasyzhjk <fantasyzhjk at aur dot archlinux dot org>
# Upstream: https://github.com/osuplusplus/OPP

pkgname=opp-git
pkgver=0.6.0.r0.g0000000
pkgrel=1
pkgdesc='An all-in-one osu! toolkit (built from git master)'
url='https://github.com/osuplusplus/OPP'
license=('MIT')
arch=('x86_64')

depends=(
  'alsa-lib'                # cpal 本地音频（ALSA）
  'dbus'                    # MPRIS 媒体控制、Secret Service 通道
  'desktop-file-utils'      # 运行时注册 opp:// 深链的 update-desktop-database
  'gtk3'
  'hicolor-icon-theme'      # hicolor 图标
  'libayatana-appindicator' # 托盘
  'libx11'                  # live_render X11 原生子窗口
  'webkit2gtk-4.1'          # Tauri/Wry 界面
  'xdg-utils'               # 深链注册 xdg-mime 与系统打开器
)
makedepends=(
  'cargo'
  'git'
  'librsvg'
  'nodejs>=22'
  'pnpm'
  'rust'
)
optdepends=(
  'ffmpeg: Danser 渲染、Trainer 与视频工具'
  'danser: 本地回放渲染后端'
  'tosu: 游戏内覆盖数据源（经 pkexec 提权启动）'
  'osu-lazer: osu! lazer 客户端'
  'osu: Wine 下的 osu! Stable 客户端'
)
provides=('opp')
conflicts=('opp' 'opp-bin')

source=(
  'git+https://github.com/osuplusplus/OPP.git'
  'opp.desktop'
  'LICENSE'
)
sha256sums=(
  'SKIP'
  '9ec96c471a6ed7a6963b6fd190e97b79adb92b57281726d308963b92999f52ef'
  '90e042cc6b2fdeb48c52142ffec83ce6f7706a664fef3bb11d65eb7a68d80039'
)

pkgver() {
  cd OPP
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd OPP
  export PNPM_HOME="$srcdir/.pnpm"
  export PATH="$PNPM_HOME:$PATH"
  pnpm install
  pnpm tauri build --no-bundle
}

package() {
  cd OPP
  install -Dm755 src-tauri/target/release/opp "$pkgdir/usr/bin/opp"
  install -Dm644 "$srcdir/opp.desktop" "$pkgdir/usr/share/applications/OPP.desktop"
  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/opp.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/opp.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/opp.png"
  install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/opp.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
