# Maintainer: Sthn
#
# ─── 关于 / About ───────────────────────────────────────────────────────
# Mineradio 是一款沉浸式音乐播放器，融合天气电台、歌词舞台、粒子视觉和 3D 歌单架。
# 原项目由 XxHuberrr 设计与开发，仅支持 Windows。
# https://github.com/XxHuberrr/Mineradio
#
# 本 AUR 包是社区维护的 Linux 移植版，在原作者代码基础上做了以下适配：
#   1. GPU 渲染：移除 Windows 专属的 use-angle=d3d11 等开关，修复 Linux 下 GPU 崩溃
#   2. 图标格式：Linux 下使用 icon.png 替代 icon.ico（含 favicon）
#   3. 缓存路径：将 D:\MineradioCache 改为 ~/.cache/Mineradio（符合 XDG 规范，含 beatmap）
#   4. 窗口配置：Linux 下关闭透明窗口（Wayland 渲染异常），保留无边框自带标题栏
#   5. 全屏：Linux 下跳过 setResizable guard（与 setFullScreen 冲突），全屏保持标题栏显示并避开登录信息重叠
#   6. 桌面歌词：Linux 下窗口可交互（中键切换锁定 + 左键拖动）；Wayland 无法全局监听中键，故锁定后不再点击穿透
#   7. 构建配置：package.json 添加 electron-builder Linux 构建目标
#
# 登录彩蛋：登录前有一道"世界和平"彩蛋门。解锁方式：
#   点右上角"扫码登录" → 连续点击眼睛图标 5 次（有提示）→ 输入"世界和平" → 解锁登录界面。
#
# 所有视觉设计、品牌、核心代码版权归原作者 XxHuberrr 所有。
# 本包遵循 GPL-3.0 授权。第三方音乐平台接入仅用于个人学习，请遵守各平台用户协议。

pkgname=mineradio
pkgver=2.1.0
pkgrel=1
pkgdesc='沉浸式音乐播放器，融合天气电台、歌词舞台、粒子视觉和 3D 歌单架 (Linux port, 原作者 XxHuberrr)'
arch=('x86_64')
url='https://github.com/XxHuberrr/Mineradio'
license=('GPL-3.0-only')
depends=(
  'electron'
  'gtk3'
  'libxss'
  'nss'
  'alsa-lib'
  'mpg123'
  'ffmpeg'
  'xdg-utils'
)
makedepends=(
  'nodejs'
  'npm'
  'git'
)
provides=('mineradio')
conflicts=('mineradio-git')
install=mineradio.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/XxHuberrr/Mineradio/archive/refs/tags/v$pkgver.tar.gz"
        'mineradio.desktop'
        'mineradio.sh'
        'apply-linux-fixes.py')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "$srcdir/Mineradio-$pkgver"

  # Apply Linux compatibility fixes (icon, GPU switches, cache path, window/fullscreen/lyrics)
  python3 "$srcdir/apply-linux-fixes.py" .

  # Install npm dependencies (including devDependencies for electron-builder)
  npm install --prefer-offline

  # Build Linux directory using system Electron (no download needed)
  npx electron-builder --linux dir --config.electronDist=/usr/lib/electron43
}

package() {
  cd "$srcdir/Mineradio-$pkgver"

  # Install only the app resources (not the bundled Electron binary)
  # System Electron will be used at runtime via the wrapper script
  install -dm755 "$pkgdir/opt/mineradio"
  cp -r dist/linux-unpacked/resources "$pkgdir/opt/mineradio/"

  # Make the wrapper script executable and install it
  install -Dm755 "$srcdir/mineradio.sh" "$pkgdir/usr/bin/mineradio"

  # Install desktop file
  install -Dm644 "$srcdir/mineradio.desktop" "$pkgdir/usr/share/applications/mineradio.desktop"

  # Install icon
  install -Dm644 build/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/mineradio.png"
}
