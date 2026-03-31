pkgname=trae-cn-bin
_pkgname=trae-cn
pkgver=2.3.17110
pkgrel=1
pkgdesc="TRAE CN 桌面客户端（预编译二进制包）"
arch=('x86_64')
url="https://trae.ai/"
license=('custom')
install=${pkgname}.install
makedepends=('librsvg')
depends=(
  'gtk3' 'nss' 'libxss' 'libxkbfile' 'libsecret' 'xdg-utils' 'alsa-lib' 'libnotify'
  'libxtst' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxrandr' 'pango' 'cairo' 'at-spi2-core' 'glib2' 'cups' 'expat' 'nspr' 'util-linux' 'dbus' 'gcc-libs' 'libxkbcommon' 'mesa'
)
optdepends=('vulkan-icd-loader: 启用 Vulkan 加速')
provides=('trae-cn')
conflicts=('trae-cn' 'trae-cn-desktop-bin' 'trae-bin')
source=("Trae%20CN-linux-x64-${pkgver}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/${pkgver}/linux/Trae%20CN-linux-x64.tar.gz")
sha256sums=('12673204f639ef50f4d2034273be8caac558638ff874c00810e50c00fdd99f2c')

package() {
  cd "$srcdir"

  # 解包 tar.gz -> /usr/share/${_pkgname}
  install -d "$pkgdir/usr/share/${_pkgname}"
  bsdtar -xf "Trae%20CN-linux-x64-${pkgver}.tar.gz" -C "$pkgdir/usr/share/${_pkgname}"

  # 确保关键入口具备可执行权限（上游 tar 权限偶发异常时兜底）
  if [[ -f "$pkgdir/usr/share/${_pkgname}/${_pkgname}" ]]; then
    chmod 755 "$pkgdir/usr/share/${_pkgname}/${_pkgname}"
  fi
  if [[ -f "$pkgdir/usr/share/${_pkgname}/bin/${_pkgname}" ]]; then
    chmod 755 "$pkgdir/usr/share/${_pkgname}/bin/${_pkgname}"
  fi

  # 创建可执行入口（默认启动 GUI；需要 CLI 时再走上游 cli.js）
  install -d "$pkgdir/usr/bin"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/${_pkgname}" <<'EOF'
#!/usr/bin/env bash
set -uo pipefail

app_dir="/usr/share/trae-cn"
gui="$app_dir/trae-cn"
cli="$app_dir/bin/trae-cn"

hint_on_fail() {
  local code="$1"
  local elapsed_s="$2"
  local kind="$3"
  local user_argc="$4"

  # CLI 的“秒退”是预期行为（--help/--version 等），不要误报。
  # GUI 的“秒退”可能是崩溃，也可能是把请求转发给已运行实例后正常退出。
  # 仅在“无参数直接启动 GUI”且秒退时，按失败提示。
  local need_hint=0
  if [[ "$kind" == "GUI" ]]; then
    if [[ "$code" -ne 0 ]]; then
      need_hint=1
    elif [[ "$user_argc" -eq 0 && "$elapsed_s" -lt 2 ]]; then
      need_hint=1
    fi
  else
    if [[ "$code" -ne 0 ]]; then
      need_hint=1
    fi
  fi

  if [[ "$need_hint" -eq 1 ]]; then
    printf '%s\n' "Trae CN 未能正常启动（${kind}，退出码 ${code}，用时 ${elapsed_s}s）。" >&2
    printf '%s\n' "如无任何窗口弹出，可尝试：" >&2
    printf '%s\n' "1) 清理 Electron 配置：rm -rf \"\$HOME/.config/Electron\"" >&2
    printf '%s\n' "2) 打印日志重试：ELECTRON_ENABLE_LOGGING=1 trae-cn --enable-logging=stderr --v=1" >&2
  fi
}

run_and_hint() {
  local kind="$1"; shift
  local user_argc="$1"; shift
  local start_ts end_ts elapsed_s code
  start_ts=$(date +%s)
  "$@"
  code=$?
  end_ts=$(date +%s)
  elapsed_s=$(( end_ts - start_ts ))
  hint_on_fail "$code" "$elapsed_s" "$kind" "$user_argc"
  return "$code"
}

# 远程终端场景（如集成终端）优先走 CLI
if [[ -n "${VSCODE_IPC_HOOK_CLI:-}" ]]; then
  run_and_hint "CLI" "$#" "$cli" "$@"
  exit $?
fi

# 无参数时，优先启动 GUI（避免上游 CLI 无输出直接退出）
if [[ "$#" -eq 0 ]]; then
  run_and_hint "GUI" 0 "$gui"
  exit $?
fi

# 常见纯 CLI 子命令/参数，保持原有行为
for arg in "$@"; do
  case "$arg" in
    --help|--version|--status|--verbose|--list-extensions|--install-extension|--uninstall-extension|--file-write|tunnel|serve-web)
      run_and_hint "CLI" "$#" "$cli" "$@"
      exit $?
      ;;
  esac
done

run_and_hint "GUI" "$#" "$gui" "$@"
exit $?
EOF

  # Electron chrome-sandbox 兼容（与 VSCode/Slack 等一致）
  if [[ -f "$pkgdir/usr/share/${_pkgname}/chrome-sandbox" ]]; then
    chmod 4755 "$pkgdir/usr/share/${_pkgname}/chrome-sandbox"
  fi

  # Desktop entry & icon
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${_pkgname}.desktop" <<'EOF'
[Desktop Entry]
Name=Trae CN
Comment=TRAE CN 桌面客户端
TryExec=/usr/bin/trae-cn
Exec=/usr/bin/trae-cn %F
Terminal=false
Type=Application
Icon=trae-cn
Categories=Development;IDE;
MimeType=inode/directory;text/plain;
StartupWMClass=trae-cn
StartupNotify=true
EOF

  icon_svg="$pkgdir/usr/share/${_pkgname}/resources/app/out/media/trae-logo.svg"
  if [[ -f "$icon_svg" ]]; then
    install -Dm644 "$icon_svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

    if command -v rsvg-convert >/dev/null 2>&1; then
      for size in 256 128 64 48 32 16; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        rsvg-convert -w "$size" -h "$size" "$icon_svg" \
          -o "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
      done
    fi
  elif [[ -f "$pkgdir/usr/share/${_pkgname}/resources/app/resources/linux/code.png" ]]; then
    # 兜底：上游未提供 trae-logo.svg 时沿用旧图标
    for size in 1024x1024 512x512 256x256 128x128; do
      install -Dm644 "$pkgdir/usr/share/${_pkgname}/resources/app/resources/linux/code.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}/apps/${_pkgname}.png"
    done
  fi

  # 许可证放置（若上游提供）
  if [[ -f "$pkgdir/usr/share/${_pkgname}/LICENSES.chromium.html" ]]; then
    install -Dm644 "$pkgdir/usr/share/${_pkgname}/LICENSES.chromium.html" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
  fi
}

pkgver() {
  # 如需从上游内部版本号转化，可在此定制；当前直接使用 URL 中的版本。
  printf "%s" "$pkgver"
}
