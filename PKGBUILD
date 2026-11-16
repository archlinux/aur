# Maintainer: Keep-Silence <keep137950@163.com>
# Contributor: xuewuerduo <xuewuerudo@gmail.com>
#
# dsh-desktop-git — DeepSeek Harness 的桌面客户端（从源码构建，Arch 原生打包）
# ===========================================================================
# 上游 Linux 状态：v0.14.0 的 README 仍写明 Linux“当前不支持”，Release 只发
# macOS/Windows，CI 也没有 Linux 作业；仓库里的 Linux 目标（package:linux:x64、
# electron-builder.linux.cjs、office linux-x64 载荷、sherpa 重编译）属于未发布、
# 未验证的路径。因此本包继续走 AUR 精简构建：不打包 Office 运行时。
#
# 构建流程：
#   1. npm ci                安装依赖；postinstall 完成补丁、品牌注入与 Electron 下载
#   2. ppt:build             electron-vite 构建前的模板/运行时就绪
#   3. electron-vite build   编译主进程、preload、renderer 与插件
#   4. electron-builder --linux dir => dist/linux-unpacked/
#   5. package()             安装到 /opt/dsh-desktop，写软链、.desktop、图标
#
# 辅助脚本（随包提供）：
#   - dsh-linux-patch-deps.mjs（社区 ethanrise/dsh-desktop，MIT）：修复
#     libreoffice-kit 在 asar 下的探测（WASM 回退），并从 dsh-desktop.patch.yml
#     移除 dsh-desktop-office 组合项（本包无 Office 载荷，保留会让启动 ENOENT）；
#   - dsh-linux-after-pack.cjs：替换上游 afterPack。上游强制校验 Office 载荷，
#     本机没有，故只跑 asar 布局（硬校验）与 PPT 运行时（软校验），跳过 Office；
#   - dsh-linux-about-menu.mjs：隐藏关于面板的“版本切换”（Arch 由 pacman 管版本）。
#
# 本包**不包含 Office 运行时**，DOCX/PPTX/XLSX 技能不可用；PPT 编辑/渲染仍可用。
#
# 版本策略：跟随上游最新 release tag（v 前缀），排除带 - 的预发布 tag；
# prepare() 检出该 tag，保证打出的包与版本号严格对应同一份源码。
#
pkgname=dsh-desktop-git
pkgver=0.14.0
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

# 中国大陆加速：_geo_is_cn 用 https://api.ip.sb/geoip 的 country_code 判断地区，
# 命中 CN 时自动把 npm registry 与 Electron 预编译包切到 npmmirror（结果缓存
# 24 小时，接口失败按非 CN 处理）。开关：
#   DSH_NO_MIRROR=1         强制官方源
#   DSH_FORCE_CN=1          跳过检测，按 CN 处理
#   DSH_GIT_PROXY=<url>     git 拉源码走代理（如 http://127.0.0.1:10808）
#   DSH_GITHUB_MIRROR=<url> git 层 GitHub 镜像前缀（默认不启用）
#
# ── 区域自适应镜像（见文件头说明）─────────────────────────────────────────────
_geo_cache="${XDG_CACHE_HOME:-$HOME/.cache}/dsh-desktop-git-geo.v2"
_geo_is_cn() {
  [[ ${DSH_NO_MIRROR:-0} == 1 ]] && return 1
  [[ ${DSH_FORCE_CN:-0} == 1 ]] && return 0
  local cc=''
  if [[ -s $_geo_cache ]] && (( $(stat -c %Y "$_geo_cache" 2>/dev/null || echo 0) > $(date +%s) - 86400 )); then
    cc=$(<"$_geo_cache")
  else
    # api.ip.sb 对没有 User-Agent 的请求返回 403，必须带浏览器 UA；
    # 同时强制直连：环境里有 HTTPS_PROXY 时会从代理出口取到 US 等错误结果。
    cc=$(curl -fsS --noproxy '*' --max-time 5 -A 'Mozilla/5.0' https://api.ip.sb/geoip 2>/dev/null \
      | sed -n 's/.*"country_code"[[:space:]]*:[[:space:]]*"\([A-Za-z]*\)".*/\1/p' | head -1)
    if [[ -n $cc ]]; then
      ( mkdir -p "${_geo_cache%/*}" && printf '%s' "$cc" >"$_geo_cache" ) 2>/dev/null || true
    fi
  fi
  [[ $cc == CN ]]
}

if _geo_is_cn; then
  export ELECTRON_MIRROR="${ELECTRON_MIRROR:-https://npmmirror.com/mirrors/electron/}"
  export npm_config_registry="${npm_config_registry:-https://registry.npmmirror.com}"
fi

source=("$pkgname::git+https://github.com/dataelement/dsh-desktop.git"
        'dsh-desktop.desktop'
        'dsh-linux-after-pack.cjs'
        'dsh-linux-patch-deps.mjs'
        'dsh-linux-about-menu.mjs')
sha256sums=('SKIP'
            'e61601b9dff6b609c097bc1af53c7c9b684472cb382ff840200040f0e355dfea'
            '0a10de6f7f2edc9f1c573d2980bae6345f56bc425a14c4cfe49b1f3bc3ee7310'
            '1e5da34c75be24e1495dd87df09a1ac6e26985b5ebfe757503fee67b48ce75d8'
            '932328d53f9c39aec5f32eee79bd28af4d08b330292cdb2765530958d119c995')

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

  # Electron / npm 的镜像由文件头的 _geo_is_cn 按地区统一设置
  npm ci

  # 上游 CI 在打包前用 release tag 覆盖 package.json 版本（仓库内固定为旧号），
  # 这里同样处理，避免应用内版本号落后于包版本
  npm version --no-git-tag-version --allow-same-version "$pkgver"

  # 修复 libreoffice-kit 的 asar 探测（见文件头）
  node "$srcdir/dsh-linux-patch-deps.mjs" .

  # Linux 菜单/关于面板：隐藏“版本切换”（见文件头）
  node "$srcdir/dsh-linux-about-menu.mjs" .

  # 不打包 Office 运行时；空目录用于满足 extraResources
  rm -rf .build/office-runtime
  mkdir -p .build/office-runtime
  export LINUX_NO_OFFICE_RUNTIME=1

  # 依次执行上游 `npm run build` 的步骤，跳过 office:prepare
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
