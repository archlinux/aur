# Maintainer: xuewuerduo <xuewuerudo@gmail.com>
#
# dsh-desktop-git — DeepSeek Harness 的桌面客户端（从源码构建，Arch 原生打包）
# ===========================================================================
# DSH Desktop 官方没有发布 Linux 二进制（Linux 包一直是“从源码本地构建”），
# 因此本 PKGBUILD 直接克隆官方源仓库，按官方流程构建出 Electron 应用本体，
# 再以 Arch 原生布局安装（/opt/dsh-desktop + .desktop + hicolor 图标），
# 不经过 .deb/fpm。
#
# 版本策略：跟随上游最新 release tag（v 前缀，如 v0.9.0），排除 test/rc/preview tag；
# 构建时 prepare() 检出该 tag，保证打出的包与版本号严格对应同一份源码。
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
# 国内构建：build() 会自动探测 GitHub，不可达时自动用 npmmirror 加速下载 Electron
# （也可手动覆盖：ELECTRON_MIRROR=... makepkg）。npm 依赖本身已走 lockfile 的 npmmirror。

pkgname=dsh-desktop-git
pkgver=0.9.0
pkgrel=1
pkgdesc='Cross-platform desktop shell for DeepSeek Harness: local Agent runtime, model providers, mobile phone pairing, editable PPTX generation'
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
makedepends=('curl'
             'git'
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

# 最新 v 前缀 release tag（按版本号降序取第一个；v 前缀天然排除 test/rc/preview）
_latest_tag() {
  local tag
  tag=$(git for-each-ref --sort=-v:refname --format='%(refname:short)' 'refs/tags/v[0-9]*' | head -1)
  if [[ -z "$tag" ]]; then
    # 兜底：没有任何 v 前缀 tag 时退回 HEAD 短哈希
    tag="v0.0.0.r$(git rev-list --count HEAD).g$(git rev-parse --short=7 HEAD)"
  fi
  printf '%s' "$tag"
}

pkgver() {
  cd "$srcdir/$pkgname"
  local tag
  tag=$(_latest_tag)
  printf '%s' "${tag#v}"
}

prepare() {
  cd "$srcdir/$pkgname"
  # 检出最新 release tag，保证构建的源码与版本号一致
  git checkout -q "$(_latest_tag)"
}

build() {
  cd "$srcdir/$pkgname"

  export npm_config_audit=false
  export npm_config_fund=false

  # 下载加速：Electron 二进制（postinstall 与 electron-builder 都会下载）。
  # 若未显式指定 ELECTRON_MIRROR，且官方源 GitHub 10 秒内不可达（国内常见），
  # 自动切换到 npmmirror 国内加速镜像；官方源可达则保持默认。
  if [[ -z "${ELECTRON_MIRROR:-}" ]] && ! timeout 10 curl -fsI https://github.com >/dev/null 2>&1; then
    export ELECTRON_MIRROR='https://npmmirror.com/mirrors/electron/'
    echo "==> GitHub 不可达，Electron 下载已切换到 npmmirror 国内加速镜像"
    echo "==> 如需官方源可自行: ELECTRON_MIRROR='https://github.com/electron/electron/releases/download/' makepkg"
  fi

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
