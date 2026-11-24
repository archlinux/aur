# Maintainer: lzsnyy <710080675@qq.com>
#
# Unofficial Linux port of the WorkBuddy domestic edition (workbuddy.cn).
#
# Upstream ships a Linux deb, but it is still on the 5.6.x application while
# the Windows client is on 5.11.x. So the payload comes from the official
# Windows archive (win32-x64): its app.asar is platform-neutral JavaScript and
# already carries the Linux builds of koffi, @lydell/node-pty and
# @ban-dal/os-bridge. The Electron runtime, the Node/Python session runtimes
# and the Linux CLI helpers (ripgrep, genie-trash) come from the official
# domestic Linux deb. That deb's Electron carries the proprietary
# "workbuddyStorage" binding that sign-in depends on; stock Electron fails
# with CREDENTIAL_BOOTSTRAP_FAILED.
#
# Every artifact is pinned in source=() with a sha256, so makepkg downloads
# exactly what is audited here and the build itself runs fully offline.
#
# See DISCLAIMER and port.sh for the conversion steps.

pkgname=workbuddy-agent
_pkgver=5.11.3.43806934
_build=ecace0f7
_hostver=5.6.2.40046327
_hostbuild=c7b525f3
_electron=37.10.3
_sandbox=5.13.0
_harness=0.2.0-beta.16
pkgver=${_pkgver}_${_build}
pkgrel=2
pkgdesc="腾讯云代码助手推出的 AI Agent 办公工具"
arch=('x86_64' 'aarch64')
url="https://www.workbuddy.cn/app"
license=('custom')
changelog=changelog.md
depends=('gtk3' 'nss' 'alsa-lib' 'libcups' 'libdrm' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi'
         'libxkbcommon' 'libxrandr' 'mesa' 'libsecret' 'libappindicator'
         'libpulse' 'libnotify' 'json-glib' 'wayland' 'systemd-libs' 'dbus'
         'xdg-utils' 'desktop-file-utils')
makedepends=('nodejs' 'unzip' 'libarchive' 'file')
optdepends=(
	'python-pip'
	'nodejs-lts: frontend skills'
	'imagemagick'
	'gnome-shell-extension-appindicator'
)
provides=()
conflicts=('workbuddy')

_win_archive="WorkBuddy-win32-x64-archive-${_pkgver}-${_build}.zip"
_win_url="https://download.codebuddy.cn/workbuddy/saas/win32-x64-archive/${_win_archive}"

source=(
  'port.sh'
  'asar.cjs'
  'patch.cjs'
  'verify-native.cjs'
  'WorkBuddy.desktop'
  'workbuddy-cn-16.png'
  'workbuddy-cn-24.png'
  'workbuddy-cn-32.png'
  'workbuddy-cn-48.png'
  'workbuddy-cn-64.png'
  'workbuddy-cn-96.png'
  'workbuddy-cn-128.png'
  'workbuddy-cn-256.png'
  'workbuddy-cn-512.png'
  'DISCLAIMER'
)
source_x86_64=(
  "${_win_archive}::${_win_url}"
  "WorkBuddy-linux-x64-deb-${_hostver}-${_hostbuild}.deb::https://download.codebuddy.cn/workbuddy/saas/linux-x64-deb/WorkBuddy-linux-x64-deb-${_hostver}-${_hostbuild}.deb"
  "sandbox-cli-linux-x64-${_sandbox}.tgz::https://registry.npmjs.org/@tencent-ai/sandbox-cli-linux-x64/-/sandbox-cli-linux-x64-${_sandbox}.tgz"
  "agent-harness-linux-x64-${_harness}.tgz::https://registry.npmjs.org/@tencent-ai/agent-harness-linux-x64/-/agent-harness-linux-x64-${_harness}.tgz"
)
source_aarch64=(
  "${_win_archive}::${_win_url}"
  "WorkBuddy-linux-arm64-deb-${_hostver}-${_hostbuild}.deb::https://download.codebuddy.cn/workbuddy/saas/linux-arm64-deb/WorkBuddy-linux-arm64-deb-${_hostver}-${_hostbuild}.deb"
  "sandbox-cli-linux-arm64-${_sandbox}.tgz::https://registry.npmjs.org/@tencent-ai/sandbox-cli-linux-arm64/-/sandbox-cli-linux-arm64-${_sandbox}.tgz"
  "agent-harness-linux-arm64-${_harness}.tgz::https://registry.npmjs.org/@tencent-ai/agent-harness-linux-arm64/-/agent-harness-linux-arm64-${_harness}.tgz"
)
noextract=(
  "${_win_archive}"
  "WorkBuddy-linux-x64-deb-${_hostver}-${_hostbuild}.deb"
  "WorkBuddy-linux-arm64-deb-${_hostver}-${_hostbuild}.deb"
  "sandbox-cli-linux-x64-${_sandbox}.tgz"
  "sandbox-cli-linux-arm64-${_sandbox}.tgz"
  "agent-harness-linux-x64-${_harness}.tgz"
  "agent-harness-linux-arm64-${_harness}.tgz"
)
sha256sums=(
  'd6a32df9856295649310535edfce2c09c9d0a49bbaed446a5bd1e9c6dc5eec8b'  # port.sh
  '3f27f7ab421d88f374470b6f97b9e9eb6d67425ac27ddc7d05c4ca304f63bfd4'  # asar.cjs
  'ff5bf13b8a9bdecd3113988b2b908a454d9bf6d8dbd074eff4128f696b875588'  # patch.cjs
  '08679e5b3425f9d60ba1a27e4478845293aba0722cdd0c33b604be35c79d026a'  # verify-native.cjs
  'b84bfec17cf7eb6478567b292e907faf454327a0509f6993996e5aaa87eda119'  # WorkBuddy.desktop
  '7bb2f875b641770db3918eca62831398ef5328ce516f3dce37b899cfcf8e2054'
  'f4ff4531dc86f25f7e0d0f0fe5580ec6ef5c1dd709cbc929884403de1ab55d77'
  '0a37763b8d0ec1f139e3207bf06f1a88a0beaa741c04485e78eedba3b80498e5'
  '48e7003ba8e53d007a1a47fe0a1f71b0f0c6036d5521c590fe95ff599ababeec'
  '6fa72887edc2c50c1ecf5c346a32758325fae340917a3c77d2c70bbd404db666'
  '353d4444155e399fb264610e1bcc188116ca380d17ad94f749211f0b97cbda8c'
  'cc68649f15ad7285ca926e83ed04f35d0f21e16c498e8483b9a80e47f4710aef'
  '58d58c5c5f07e51d9a2fe6bbc0eb0fcb1594c26fcd5a091200cc79c44bf4d348'
  'a9d8aaac19eb71eca4b3ab051733b74540c74ca9bed99230d77f486b95376af1'
  'f460d3c646720cf0cab795f4521a59107eb8b917c4ee64fa20335ac5c0d77535'  # DISCLAIMER
)
sha256sums_x86_64=(
  '3a691c7379a2245a60fa52b646d9dfaddc39fff6c0eaeeb90e41c0f10a1787e8'
  '12149ad8c0cd748fd5062d8f62c7827d688d8095427ada99b1ae9e7019897523'
  '7d025751a9005a182d1c2a99f4362454df494340cab27c8ddb625d9f0dd85785'
  '834fe6f1a07cecc42ffbd8ef263cc9a1eb08c515457ab1ca0121917cbb88ebe9'
)
sha256sums_aarch64=(
  '3a691c7379a2245a60fa52b646d9dfaddc39fff6c0eaeeb90e41c0f10a1787e8'
  '561822578435d382a06d0a0b079a4b157f68b588c9fe72d589e2a88b2fd155fa'
  'b6cde29df99abf3b082cc8f1e10801f279712423c9727fd7386b295c8cb2c50a'
  '6651fa80faac30d822a9ee3e44f342db26f381110c5da5ef3b931eb8c7d4e704'
)

options=(!strip !debug)

build() {
  local machine
  case "${CARCH}" in
    x86_64)
      machine=x64
      export HOST_DEB="${srcdir}/WorkBuddy-linux-x64-deb-${_hostver}-${_hostbuild}.deb"
      export SANDBOX_TGZ="${srcdir}/sandbox-cli-linux-x64-${_sandbox}.tgz"
      export HARNESS_TGZ="${srcdir}/agent-harness-linux-x64-${_harness}.tgz"
      ;;
    aarch64)
      machine=arm64
      export HOST_DEB="${srcdir}/WorkBuddy-linux-arm64-deb-${_hostver}-${_hostbuild}.deb"
      export SANDBOX_TGZ="${srcdir}/sandbox-cli-linux-arm64-${_sandbox}.tgz"
      export HARNESS_TGZ="${srcdir}/agent-harness-linux-arm64-${_harness}.tgz"
      ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  export WIN_ZIP="${srcdir}/${_win_archive}"
  export MACHINE="${machine}"
  export EXPECTED_ELECTRON="${_electron}"
  export EXPECTED_SANDBOX="${_sandbox}"
  export EXPECTED_HARNESS="${_harness}"
  export WORK_DIR="${srcdir}/build-work"
  export OUT_DIR="${srcdir}/app-out"
  export SCRIPT_DIR="${srcdir}"

  bash "${srcdir}/port.sh"

  # Smoke-test every native component against the runtimes we ship.
  ELECTRON_RUN_AS_NODE=1 "${srcdir}/app-out/workbuddy" \
    "${srcdir}/verify-native.cjs" "${srcdir}/app-out"
  "${srcdir}/app-out/resources/runtime/node/bin/node" \
    "${srcdir}/verify-native.cjs" "${srcdir}/app-out" --cli
}

package() {
  install -dm755 "${pkgdir}/opt/WorkBuddy"
  cp -a "${srcdir}/app-out/." "${pkgdir}/opt/WorkBuddy/"

  # 覆盖官方图标：国内版加 CN 角标，与国际版区分。
  local _size
  for _size in 16 24 32 48 64 96 128 256 512; do
    install -Dm644 "${srcdir}/workbuddy-cn-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/workbuddy.png"
  done
  install -Dm644 "${srcdir}/workbuddy-cn-256.png" \
    "${pkgdir}/usr/share/pixmaps/workbuddy.png"

  install -Dm644 "${srcdir}/WorkBuddy.desktop" \
    "${pkgdir}/usr/share/applications/workbuddy.desktop"

  # Pin the window class to the desktop file's basename so the X11 WM_CLASS
  # and the Wayland app_id both match workbuddy.desktop.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/workbuddy" <<'LAUNCHER'
#!/bin/sh
unset ELECTRON_RUN_AS_NODE
export CHROME_DESKTOP='workbuddy.desktop'
export ELECTRON_FORCE_IS_PACKAGED=1

# Wayland 下 Electron 注册全局快捷键会走 XDG GlobalShortcuts portal，GNOME 会
# 弹出 "Add Keyboard Shortcuts" 授权窗。shortcut-state.json 里的空 accelerator
# 表示「不注册该快捷键」，首次启动前写入可避免每次打开都弹窗；用户仍可在
# “设置 → 快捷键”里自行指定（保存后会覆盖本文件）。X11 不触发该门户，
# 保留上游默认的全局快捷键。
if [ "${XDG_SESSION_TYPE:-}" = wayland ] || [ -n "${WAYLAND_DISPLAY:-}" ]; then
  STATE_DIR="${WORKBUDDY_USER_DATA_DIR:-${WORKBUDDY_CONFIG_DIR:-${CODEBUDDY_CONFIG_DIR:-$HOME/.workbuddy}}/app}"
  STATE_FILE="$STATE_DIR/shortcut-state.json"
  if [ ! -f "$STATE_FILE" ]; then
    mkdir -p "$STATE_DIR" &&
      printf '%s\n' '{"version":1,"toggleWindowAccelerator":""}' >"$STATE_FILE" || true
  fi
fi

# 与 intl 移植版保持一致：Windows payload 跑在官方 deb 的 Electron 上，需要
# 关闭 GPU sandbox、启用 ozone/Wayland IME，避免部分驱动下窗口空白。
exec /opt/WorkBuddy/workbuddy \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-gpu-sandbox \
  --in-process-gpu \
  --ozone-platform-hint=auto \
  --enable-wayland-ime \
  --class=workbuddy "$@"
LAUNCHER

  install -Dm644 "${srcdir}/DISCLAIMER" \
    "${pkgdir}/usr/share/licenses/${pkgname}/DISCLAIMER"
}
