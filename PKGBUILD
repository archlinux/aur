# Maintainer: Keep-Silence <keep137950@163.com>
# Contributor: xuewuerduo <xuewuerudo@gmail.com>
#
# dsh-desktop-git — DeepSeek Harness 的桌面客户端（从源码构建，Arch 原生打包）
# ===========================================================================
# 上游 Linux 说明：dataelement/dsh-desktop 只发布 macOS/Windows 安装包，README
# 明确标注 Linux“Not currently supported”。自 v0.11.0 起，构建链中的 Office
# 运行时准备（office:prepare）与打包后校验（afterPack）只接受 macOS/Windows，
# 直接 `npm run build` 会在 Linux 上报：
#   Office runtime: unsupported native target linux/x64
#
# 本 PKGBUILD 因此不执行上游 `npm run build`，而是分步执行，并采用社区 Linux
# 打包工程 ethanrise/dsh-desktop（MIT）的两个适配脚本（按固定版本随包提供，
# 不修改上游源码）：
#   - dsh-linux-patch-deps.mjs：修复 libreoffice-kit 在 asar 下的探测，
#     让 Linux 能走 WASM 回退；
#   - dsh-linux-after-pack.cjs：替换上游 afterPack，跳过 Office 运行时校验。
#
# 由于上游未提供 Linux 版 Office Python 载荷，本包**不包含 Office 运行时**，
# DOCX/PPTX/XLSX 技能不可用；PPT 编辑/渲染仍可用。
#
# 版本策略：跟随上游最新 release tag（v 前缀，如 v0.12.0），排除带 - 后缀的
# test/rc/preview/beta 等预发布 tag；
# 构建时 prepare() 检出该 tag，保证打出的包与版本号严格对应同一份源码。
#
# 构建流程：
#   1. npm ci                安装依赖；postinstall 完成补丁、品牌资源注入
#                            与 Electron 43 二进制下载
#   2. ppt:build             electron-vite 构建前的模板/运行时就绪
#   3. electron-vite build   编译主进程、preload、renderer 与插件
#   4. electron-builder --linux dir => dist/linux-unpacked/
#   5. package()             安装 linux-unpacked 到 /opt/dsh-desktop，
#                             写入 /usr/bin 软链、.desktop、hicolor 图标
#
# 依赖锁定在仓库的 package-lock.json（resolved 指向 npmmirror，公开镜像全球可访问），
# 直接按 lockfile 安装即可。注意：不要用 replace-registry-host=always 强改 registry，
# 否则 file: 本地依赖的路径会被误改写成 registry URL 导致 404。


pkgname=dsh-desktop-git
pkgver=0.13.0
pkgrel=1
pkgdesc='Cross-platform desktop shell for DeepSeek Harness: local Agent runtime, model providers, mobile phone pairing, editable PPTX generation (Linux build without the bundled Office runtime)'
arch=('x86_64')
url='https://github.com/dataelement/dsh-desktop'
license=('MIT')
install=dsh-desktop-git.install

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
# Electron/Chromium 二进制不能被 strip，否则可能无法启动
options=('!strip')

source=("$pkgname::git+https://github.com/dataelement/dsh-desktop.git"
        'dsh-desktop.desktop'
        'dsh-linux-after-pack.cjs'
        'dsh-linux-patch-deps.mjs')
sha256sums=('SKIP'
            'e61601b9dff6b609c097bc1af53c7c9b684472cb382ff840200040f0e355dfea'
            '8683aefb28c9a23f29acc58dd9269b4cbc288ff754315b507a7d9120574aafb6'
            'cdddf8134576a201f8cdca2f4b707b95bed0859a5891b9690e013cab5272d806')

# 最新 v 前缀 release tag（按版本号降序取第一个）
_latest_tag() {
  local tag
  # 带 - 的 tag（v0.10.0-beta、v0.9.0-test 等）是预发布版本，一律排除
  tag=$(git for-each-ref --sort=-v:refname --format='%(refname:short)' 'refs/tags/v[0-9]*' \
        | grep -v -- '-' | head -1)
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
  git checkout -q -f "$(_latest_tag)"
}

build() {
  cd "$srcdir/$pkgname"

  export npm_config_audit=false
  export npm_config_fund=false

  npm ci

  # 上游 CI 在打包前用 release tag 覆盖 package.json 版本（仓库内固定为旧号），
  # 这里同样处理，避免应用内版本号落后于包版本
  npm version --no-git-tag-version --allow-same-version "$pkgver"

  # 上游 office:prepare / afterPack 仅支持 macOS/Windows，见文件头说明。
  node "$srcdir/dsh-linux-patch-deps.mjs" .

  # 不打包 Office 运行时（上游无 Linux 载荷）；空目录用于满足 extraResources
  rm -rf .build/office-runtime
  mkdir -p .build/office-runtime
  export LINUX_NO_OFFICE_RUNTIME=1

  # 依次执行上游 `npm run build` 的各步骤，跳过 office:prepare
  npm run --if-present ppt:build
  npx electron-vite build

  npx electron-builder --linux dir --x64 --publish never \
    -c.electronDist="$PWD/node_modules/electron/dist" \
    -c.afterPack="$srcdir/dsh-linux-after-pack.cjs"
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
