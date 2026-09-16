# Maintainer: xuewuerduo <xuewuerudo@gmail.com>
#
# dsh-desktop-git — DeepSeek Harness 的桌面客户端（从源码构建，Arch 原生打包）
# ===========================================================================
# DSH Desktop 官方没有发布 Linux 二进制（Linux 包一直是“从源码本地构建”），
# 因此本 PKGBUILD 直接克隆官方源仓库，按官方流程构建出 Electron 应用本体，
# 再以 Arch 原生布局安装（/opt/dsh-desktop + .desktop + hicolor 图标），
# 不经过 .deb/fpm。
#
# 构建流程：
#   1. npm ci                安装依赖；postinstall 自动完成
#                             - patch-package 补丁
#                             - 品牌资源注入
#                             - 下载 Electron 43 二进制（GitHub Releases）
#                             - 安装捆绑的 Node.js 运行时（nodejs.org）
#   2. npm run package:dir   electron-vite build + electron-builder --dir
#                             => dist/linux-unpacked/（应用本体）
#   3. package()              安装 linux-unpacked 到 /opt/dsh-desktop，
#                             写入 /usr/bin 软链、.desktop、hicolor 图标
#
# 依赖锁定在仓库的 package-lock.json（resolved 指向 npmmirror，公开镜像全球可访问），
# 直接按 lockfile 安装即可。注意：不要用 replace-registry-host=always 强改 registry，
# 否则 file: 本地依赖的路径会被误改写成 registry URL 导致 404。
# 国内构建如遇 Electron 二进制下载慢，可在 makepkg 前加：
#   export ELECTRON_MIRROR=https://npmmirror.com/mirrors/electron/

pkgname=dsh-desktop-git
pkgver=0.1.1.r428.gaca9708
pkgrel=1
pkgdesc='A cross-platform desktop shell for DeepSeek Harness'
arch=('x86_64')
url='https://github.com/dataelement/dsh-desktop'
license=('MIT')
# 运行时依赖 = 应用自带 Electron/Node 运行时所需的系统库
# （参照官方 .deb 声明的 Depends + Arch electron 的依赖）
depends=('alsa-lib'
         'at-spi2-core'
         'brotli'
         'c-ares'
         'flac'
         'fontconfig'
         'freetype2'
         'gcc-libs'
         'glibc'
         'gtk3'
         'harfbuzz'
         'libdrm'
         'libevent'
         'libffi'
         'libjpeg-turbo'
         'libnotify'
         'libpulse'
         'libsecret'
         'libxcomposite'
         'libxdamage'
         'libxkbcommon'
         'libxrandr'
         'libxss'
         'libxtst'
         'libxml2'
         'libxslt'
         'minizip'
         'nss'
         'opus'
         'util-linux'
         'xdg-utils'
         'zlib')
makedepends=('git'
             'imagemagick'
             'nodejs>=22'
             'npm')
optdepends=('libappindicator-gtk3: system tray icon support'
            'pipewire: WebRTC desktop sharing under Wayland')
provides=('dsh-desktop')
conflicts=('dsh-desktop')
source=("$pkgname::git+https://github.com/dataelement/dsh-desktop.git"
        'dsh-desktop.desktop')
sha256sums=('SKIP'
            'e61601b9dff6b609c097bc1af53c7c9b684472cb382ff840200040f0e355dfea')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver commits sha
  ver=$(sed -n 's/^[[:space:]]*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' package.json | head -1)
  commits=$(git rev-list --count HEAD)
  sha=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "$ver" "$commits" "$sha"
}

build() {
  cd "$srcdir/$pkgname"

  export npm_config_audit=false
  export npm_config_fund=false

  npm ci
  npm run package:dir
}

package() {
  cd "$srcdir/$pkgname"

  local appdir="$pkgdir/opt/dsh-desktop"
  [[ -d dist/linux-unpacked ]] || { echo "error: dist/linux-unpacked not found" >&2; exit 1; }

  # 应用本体（cp -r 而非 cp -a：所有权由 fakeroot 统一记为 root:root）
  install -d "$appdir"
  cp -r dist/linux-unpacked/. "$appdir/"

  # 命令行入口
  install -d "$pkgdir/usr/bin"
  ln -s /opt/dsh-desktop/dsh-desktop "$pkgdir/usr/bin/dsh-desktop"

  # .desktop 启动项
  install -Dm644 "$srcdir/dsh-desktop.desktop" \
    "$pkgdir/usr/share/applications/dsh-desktop.desktop"

  # hicolor 图标：上游未提交 Linux 图标，从 build/app-icon.png 现场生成
  local size icon
  for size in 16 32 48 64 128 256 512; do
    icon="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/dsh-desktop.png"
    install -d "$(dirname "$icon")"
    magick build/app-icon.png -resize "${size}x${size}" "$icon"
  done

  # 许可证
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
