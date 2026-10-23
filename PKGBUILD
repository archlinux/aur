# Maintainer: duanluan <duanluan@outlook.com>
#
# Built from the upstream source (desktop-workbench). The project publishes
# no Linux release: upstream ships macOS/Windows installers only, although
# the electron-builder config carries a Linux target. The bundle scripts
# download the uv and python-build-standalone runtimes for the build host
# architecture from their official releases.
#
# Note: the upstream repository carries no LICENSE file at the time of
# packaging; the license field stays NOASSERTION until upstream adds one.

pkgname=agents-anywhere
pkgver=2.0.3
pkgrel=1
pkgdesc='Open-source cross-device AI agent workbench desktop app (built from source)'
arch=('x86_64' 'aarch64')
url='https://github.com/anywhere-labs/Agents-Anywhere'
license=('NOASSERTION')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libsecret' 'libappindicator-gtk3')
makedepends=('nodejs' 'curl')
options=('!strip' '!debug')
source=("Agents-Anywhere-${pkgver}.tar.gz::https://github.com/anywhere-labs/Agents-Anywhere/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b36e7937e24f43318ee5bbd80710c3e378b62484f4f09483b7c5a7a8b1a3094')

build() {
  cd "${srcdir}/Agents-Anywhere-${pkgver}/desktop-workbench"

  # corepack 从 registry 拉 yarn 4 时不要交互确认
  export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
  # yarn 4 沿文件系统祖先链向上找项目根，用户家目录里误生成的
  # package.json 会被当成顶层项目（"doesn't seem to be part of the
  # project"）。空的 yarn.lock 把 workbench 声明为独立项目根，
  # 这是 yarn 报错信息里给出的官方解法
  : > yarn.lock
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
  # 即跳过，所以预先放好。GitHub 优先，失败再走镜像
  aa_fetch() {
    local dest="$1" u
    shift
    [[ -s "${dest}" ]] && return 0
    for u in "$@"; do
      curl -fsSL --retry 2 --speed-limit 1024 --speed-time 30 --max-time 600 \
        -o "${dest}" "${u}" && return 0 || true
    done
    return 1
  }
  local uv_ver uv_triple uv_asset uv_cache uv_lic uv_gh uv_raw
  uv_ver="$(sed -nE 's/.*UV_BUNDLE_VERSION \|\| \"([^\"]+)\".*/\1/p' scripts/prepare-uv.mjs | head -n1)"
  case "${CARCH}" in
    x86_64)  uv_triple='x86_64-unknown-linux-gnu' ;;
    aarch64) uv_triple='aarch64-unknown-linux-gnu' ;;
  esac
  uv_asset="uv-${uv_triple}.tar.gz"
  uv_cache=".cache/uv/${uv_ver}"
  uv_lic="build/uv/THIRD_PARTY_LICENSES/uv"
  uv_gh="https://github.com/astral-sh/uv/releases/download/${uv_ver}/${uv_asset}"
  uv_raw="https://raw.githubusercontent.com/astral-sh/uv/${uv_ver}"
  install -dm755 "${uv_cache}" "${uv_lic}"
  aa_fetch "${uv_cache}/${uv_asset}" "${uv_gh}" "https://gh-proxy.com/${uv_gh}"
  aa_fetch "${uv_cache}/${uv_asset}.sha256" "${uv_gh}.sha256" "https://gh-proxy.com/${uv_gh}.sha256"
  aa_fetch "${uv_lic}/LICENSE-MIT" "${uv_raw}/LICENSE-MIT" "https://gh-proxy.com/${uv_raw}/LICENSE-MIT"
  aa_fetch "${uv_lic}/LICENSE-APACHE" "${uv_raw}/LICENSE-APACHE" "https://gh-proxy.com/${uv_raw}/LICENSE-APACHE"
  [[ -s "${uv_cache}/${uv_asset}" && -s "${uv_cache}/${uv_asset}.sha256" &&
     -s "${uv_lic}/LICENSE-MIT" && -s "${uv_lic}/LICENSE-APACHE" ]] || {
    printf 'failed to pre-seed the uv bundle cache\n' >&2
    return 1
  }

  # 捆绑 uv 与 python-build-standalone 运行时（按构建机架构取 linux 变体）
  corepack yarn bundle:uv
  corepack yarn bundle:python

  corepack yarn build
  corepack yarn exec electron-builder --linux dir
}

package() {
  local app_dir="${srcdir}/Agents-Anywhere-${pkgver}/desktop-workbench/release/linux-unpacked"

  install -dm755 "${pkgdir}/opt/agents-anywhere"
  cp -a "${app_dir}/." "${pkgdir}/opt/agents-anywhere/"

  # chrome-sandbox 需要 setuid 才能在未启用 --no-sandbox 时工作
  chmod 4755 "${pkgdir}/opt/agents-anywhere/chrome-sandbox"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/agents-anywhere" <<'LAUNCHER'
#!/usr/bin/env bash
exec /opt/agents-anywhere/agents-anywhere-desktop-workbench "$@"
LAUNCHER

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/agents-anywhere.desktop" <<DESKTOP
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
DESKTOP

  # 上游只提供一张源图标，按 hicolor 惯例放到 512x512
  install -Dm644 "${app_dir}/resources/build/icon-mac-source.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/agents-anywhere.png"
}
