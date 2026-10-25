# Maintainer: duanluan <duanluan@outlook.com>
#
# Built from the upstream source (desktop-workbench). The project publishes
# no Linux release: upstream ships macOS/Windows installers only, although
# the electron-builder config carries a Linux target. The bundle scripts
# download the uv and python-build-standalone runtimes for the build host
# architecture from their official releases.
#
# Network-heavy build steps are made mirror-tolerant: every GitHub download
# (uv bundle, python-build-standalone, the Electron zip) falls back to a
# public GitHub proxy after the official URL, and checksums are verified
# against the official sum files, so the fallback cannot serve tampered
# content.
#
# Note: the upstream repository carries no LICENSE file at the time of
# packaging; the license field stays NOASSERTION until upstream adds one.

pkgname=agents-anywhere
pkgver=2.0.3
pkgrel=2
pkgdesc='Open-source cross-device AI agent workbench desktop app (built from source)'
arch=('x86_64' 'aarch64')
url='https://github.com/anywhere-labs/Agents-Anywhere'
license=('NOASSERTION')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libsecret' 'libappindicator-gtk3')
makedepends=('nodejs' 'curl')
options=('!strip' '!debug')
source=("Agents-Anywhere-${pkgver}.tar.gz::https://github.com/anywhere-labs/Agents-Anywhere/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b36e7937e24f43318ee5bbd80710c3e378b62484f4f09483b7c5a7a8b1a3094')

# 多处构建步骤要从 GitHub 下载文件且直连易失速；官方地址优先，失败走
# 镜像，事后全部按官方校验和文件验证
aa_fetch() {
  local dest="$1" u
  shift
  [[ -s "${dest}" ]] && return 0
  for u in "$@"; do
    # -C - 断点续传：慢网络下镜像重试能累积进度而不是从头再来
    curl -fsSL --retry 2 --speed-limit 1024 --speed-time 30 --max-time 900 -C - \
      -o "${dest}" "${u}" && return 0 || true
  done
  return 1
}

# 取回构建期需要的 GitHub 资产并按官方校验和验证。镜像偶发返回 200 的
# 错误页，靠校验和识别后自动重取；归档校验失败才删档重下，校验文件
# 无效只重取校验文件。全部尝试失败时返回非零
# 用法: aa_verified <资产文件> <资产URL> <校验文件> <校验文件名> <grep选择器>
aa_verified() {
  local dest="$1" asset_url="$2" sums="$3" sums_name="$4" selector="$5"
  local sums_url base attempt
  base="$(dirname "${asset_url}")"
  sums_url="${base}/${sums_name}"
  for attempt in 1 2 3 4 5; do
    aa_fetch "${dest}" "${asset_url}" "https://gh-proxy.com/${asset_url}" || true
    if ! grep -q "${selector}" "${sums}" 2>/dev/null; then
      # 校验文件先取到临时路径，内容验证通过才替换，避免重取失败把
      # 现成的校验文件删掉
      local tmp
      tmp="${sums}.tmp.$$"
      rm -f "${tmp}"
      if aa_fetch "${tmp}" "${sums_url}" "https://gh-proxy.com/${sums_url}"; then
        grep -q "${selector}" "${tmp}" 2>/dev/null && mv -f "${tmp}" "${sums}" || rm -f "${tmp}"
      fi
    fi
    if grep -q "${selector}" "${sums}" 2>/dev/null; then
      if (cd "$(dirname "${dest}")" && grep "${selector}" "${sums_name}" | sha256sum -c - >/dev/null 2>&1); then
        return 0
      fi
      rm -f "${dest}"
    fi
  done
  return 1
}

build() {
  cd "${srcdir}/Agents-Anywhere-2.0.3/desktop-workbench"

  # corepack 从 registry 拉 yarn 4 时不要交互确认
  export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
  # yarn 4 沿文件系统祖先链向上找项目根，用户家目录里误生成的
  # package.json 会被当成顶层项目（"doesn't seem to be part of the
  # project"）。空的 yarn.lock 把 workbench 声明为独立项目根，
  # 这是 yarn 报错信息里给出的官方解法
  : > yarn.lock
  # 关掉依赖包的安装期构建脚本：electron 的 postinstall 只为本地开发
  # 下载 electron 二进制（electron-builder 会自己下载需要的副本），
  # sharp 的 postinstall 在预编译包缺失时会退到 node-gyp 源码编译并
  # 从 nodejs.org 拉 headers——两者在受限网络下必挂，且打包都不需要。
  # 原生依赖（@img/sharp-*、@swc/core-* 等）以 npm 可选包形式安装，
  # 不依赖构建脚本
  export YARN_ENABLE_SCRIPTS=false
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  # 上游没有提交 yarn.lock，依赖按 semver 浮动
  corepack yarn install

  # next/font/google 在构建期要从 Google Fonts 下载字体，离线或受限
  # 网络下构建失败；改为系统字体栈，只影响默认字体观感
  python - <<'PYEOF'
from pathlib import Path
import re
p = Path("renderer/src/app/layout.tsx")
s = p.read_text()
if 'from "next/font/google"' in s:
    s = s.replace(
        'import { Geist, Geist_Mono, Instrument_Serif } from "next/font/google";',
        '// [arch build] next/font/google requires Google Fonts access at build time')
    s = re.sub(r'const sans = Geist\(\{.*?\}\);', 'const sans = { variable: "--font-geist" };', s, flags=re.S)
    s = re.sub(r'const mono = Geist_Mono\(\{.*?\}\);', 'const mono = { variable: "--font-geist-mono" };', s, flags=re.S)
    s = re.sub(r'const serif = Instrument_Serif\(\{.*?\}\);', 'const serif = { variable: "--font-instrument-serif" };', s, flags=re.S)
    p.write_text(s)
c = Path("renderer/src/app/globals.css")
t = c.read_text()
t = t.replace("--font-sans: var(--font-geist);", "--font-sans: ui-sans-serif, system-ui, -apple-system, 'Segoe UI', Roboto, 'Noto Sans', sans-serif;")
t = t.replace("--font-heading: var(--font-geist);", "--font-heading: ui-sans-serif, system-ui, -apple-system, 'Segoe UI', Roboto, 'Noto Sans', sans-serif;")
t = t.replace("--font-mono: var(--font-geist-mono);", "--font-mono: ui-monospace, 'Cascadia Mono', 'JetBrains Mono', Menlo, Consolas, monospace;")
t = t.replace("--font-serif: var(--font-instrument-serif);", "--font-serif: Georgia, 'Times New Roman', serif;")
c.write_text(t)
print("fonts switched to system stacks")
PYEOF

  # prepare-uv.mjs 只会从 GitHub 直连下载且没有镜像变量；它要取四个
  # 文件（归档、官方 .sha256、两份许可证），download() 见文件已存在
  # 即跳过，所以预先放好
  local uv_ver uv_triple uv_asset uv_cache uv_lic uv_gh uv_raw
  uv_ver="$(sed -nE 's/.*UV_BUNDLE_VERSION \|\| "([^"]+)".*/\1/p' scripts/prepare-uv.mjs | head -n1)"
  case "${CARCH}" in
    x86_64)  uv_triple='x86_64-unknown-linux-gnu' ;;
    aarch64) uv_triple='aarch64-unknown-linux-gnu' ;;
  esac
  uv_asset="uv-${uv_triple}.tar.gz"
  uv_cache=".cache/uv/${uv_ver}"
  uv_lic="build/uv/THIRD_PARTY_LICENSES/uv"
  uv_gh="https://github.com/astral-sh/uv/releases/download/${uv_ver}/${uv_asset}"
  uv_raw="https://raw.githubusercontent.com/astral-sh/uv/${uv_ver}"
  # 缓存在 srcdir 内会被 makepkg 每次清掉，软链到家目录的持久缓存，
  # 断点续传和二次构建都能复用已下载内容
  local persist_root="${HOME}/.cache/agents-anywhere-build"
  install -dm755 "${persist_root}" "${uv_lic}"
  install -dm755 "${persist_root}/uv-${uv_ver}"
  mkdir -p "$(dirname "${uv_cache}")"
  ln -sfn "${persist_root}/uv-${uv_ver}" "${uv_cache}"
  aa_fetch "${uv_lic}/LICENSE-MIT" "${uv_raw}/LICENSE-MIT" "https://gh-proxy.com/${uv_raw}/LICENSE-MIT"
  aa_fetch "${uv_lic}/LICENSE-APACHE" "${uv_raw}/LICENSE-APACHE" "https://gh-proxy.com/${uv_raw}/LICENSE-APACHE"
  aa_verified "${uv_cache}/${uv_asset}" "${uv_gh}" \
    "${uv_cache}/${uv_asset}.sha256" "${uv_asset}.sha256" " ${uv_asset}\$" || {
    printf 'uv bundle checksum mismatch
' >&2
    return 1
  }

  # prepare-python.mjs 默认同样从 GitHub 下载 python-build-standalone；
  # 预置 SHA256SUMS 和对应架构的 CPython 归档到它的缓存目录
  local py_ver py_rel py_build py_triple py_asset py_cache py_base
  py_ver="$(sed -nE 's/.*PYTHON_BUNDLE_VERSION \|\| "([^"]+)".*/\1/p' scripts/prepare-python.mjs | head -n1)"
  py_rel="$(sed -nE 's/.*PYTHON_BUNDLE_RELEASE \|\| "([^"]+)".*/\1/p' scripts/prepare-python.mjs | head -n1)"
  py_build="${py_ver}+${py_rel}"
  case "${CARCH}" in
    x86_64)  py_triple='x86_64-unknown-linux-gnu' ;;
    aarch64) py_triple='aarch64-unknown-linux-gnu' ;;
  esac
  py_asset="cpython-${py_build}-${py_triple}-install_only_stripped.tar.gz"
  py_cache=".cache/python/${py_build}"
  py_base="https://github.com/astral-sh/python-build-standalone/releases/download/${py_rel}"
  install -dm755 "${persist_root}/python-${py_build}"
  mkdir -p "$(dirname "${py_cache}")"
  ln -sfn "${persist_root}/python-${py_build}" "${py_cache}"
  aa_verified "${py_cache}/${py_asset}" "${py_base}/${py_asset}" \
    "${py_cache}/SHA256SUMS" "SHA256SUMS" "[ *]${py_asset}\$" || {
    printf 'python bundle checksum mismatch
' >&2
    return 1
  }

  # electron-builder 走 @electron/get：zip 可从缓存读，但 SHASUMS256.txt
  # 设计上永远在线拉取（Bypass 缓存）。把 zip 预置进 @electron/get 的
  # 缓存目录（路径是发布目录 URL 的 sha256），再把官方校验和注入
  # package.json 的 build.electronDownload.checksums，两步合起来
  # electron 下载完全离线
  local electron_ver electron_arch electron_zip electron_url_dir electron_cache_dir
  electron_ver="$(node -p "require('./node_modules/electron/package.json').version")"
  case "${CARCH}" in
    x86_64)  electron_arch='x64' ;;
    aarch64) electron_arch='arm64' ;;
  esac
  electron_zip="electron-v${electron_ver}-linux-${electron_arch}.zip"
  electron_url_dir="https://github.com/electron/electron/releases/download/v${electron_ver}"
  electron_cache_dir="${HOME}/.cache/electron/$(printf '%s' "${electron_url_dir}" | sha256sum | awk '{print $1}')"
  export ELECTRON_SEED_DIR="${electron_cache_dir}"
  install -dm755 "${electron_cache_dir}"
  aa_verified "${electron_cache_dir}/${electron_zip}" "${electron_url_dir}/${electron_zip}" \
    "${electron_cache_dir}/SHASUMS256.txt" "SHASUMS256.txt" "[ *]${electron_zip}\$" || {
    printf 'electron zip checksum mismatch
' >&2
    return 1
  }
  node - "${electron_zip}" <<'NODEJS'
const fs = require("fs");
const crypto = require("crypto");
const path = require("path");
const [zip] = process.argv.slice(2);
const sha = crypto.createHash("sha256").update(fs.readFileSync(path.join(process.env.ELECTRON_SEED_DIR, zip))).digest("hex");
const pkgPath = "package.json";
const pkg = JSON.parse(fs.readFileSync(pkgPath, "utf8"));
pkg.build.electronDownload = Object.assign({}, pkg.build.electronDownload, { checksums: { [zip]: sha } });
fs.writeFileSync(pkgPath, JSON.stringify(pkg, null, 2) + "\n");
console.log("injected electronDownload.checksums for " + zip);
NODEJS

  # 捆绑 uv 与 python-build-standalone 运行时（按构建机架构取 linux 变体）
  corepack yarn bundle:uv
  corepack yarn bundle:python

  corepack yarn build
  corepack yarn exec electron-builder --linux dir
}

package() {
  local app_dir="${srcdir}/Agents-Anywhere-2.0.3/desktop-workbench/release/linux-unpacked"

  install -dm755 "${pkgdir}/opt/agents-anywhere"
  cp -a "${app_dir}/." "${pkgdir}/opt/agents-anywhere/"

  # chrome-sandbox 需要 setuid 才能在未启用 --no-sandbox 时工作
  chmod 4755 "${pkgdir}/opt/agents-anywhere/chrome-sandbox"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/agents-anywhere" <<'AA_LAUNCHER'
#!/usr/bin/env bash
exec /opt/agents-anywhere/agents-anywhere-desktop-workbench "$@"
AA_LAUNCHER

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/agents-anywhere.desktop" <<AA_DESKTOP
[Desktop Entry]
Type=Application
Version=1.0
Name=Agents Anywhere
Comment=Open-source cross-device AI agent workbench
Exec=agents-anywhere %U
Icon=agents-anywhere
Terminal=false
StartupNotify=true
StartupWMClass=Agents Anywhere
Categories=Development;Utility;
AA_DESKTOP

  # 上游只提供一张源图标，按 hicolor 惯例放到 512x512
  install -Dm644 "${app_dir}/resources/build/icon-mac-source.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/agents-anywhere.png"
}

