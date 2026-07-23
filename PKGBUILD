# Maintainer: wingsbutterfly <wingsbutterfly@users.noreply.github.com>
# Contributor: msojocs <jiyecafe@gmail.com>
#
# GPU-accelerated bilibili client — Electron 43 (Chromium 150).
# Auto-detects GPU at runtime for VA-API hardware video decode:
#   NVIDIA → VaapiOnNvidiaGPUs (libva-nvidia-driver → NVDEC)
#   Intel / AMD → VaapiVideoDecoder (Mesa Gallium)
# Original upstream: https://github.com/msojocs/bilibili-linux
# Fork: https://github.com/wings1848/bilibili-linux

pkgname=bilibili-gpu-bin
_pkgreal=bilibili
pkgver=1.17.9
pkgrel=8
pkgdesc="Bilibili client for Linux (Electron 43, auto-detected GPU acceleration)"
arch=('x86_64')
url="https://github.com/wings1848/bilibili-linux"
license=('MIT')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libva'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'cups'
  'libxkbcommon'
  'mesa'
  'alsa-lib'
)
optdepends=(
  'libva-nvidia-driver: VA-API backend for NVIDIA GPU video decode (NVDEC)'
  'python-faster-whisper: AI subtitle transcription'
)
conflicts=('bilibili' 'bilibili-bin')
provides=("${_pkgreal}=${pkgver}")
source_x86_64=("${_pkgreal}-v${pkgver}-1-x64.tar.gz::${url}/releases/download/v${pkgver}-1/bilibili-v${pkgver}-1-x64.tar.gz")
sha256sums=('7cf1a17b2a0932927396d5fd6a5c7c5b418222a405cc99322d0a730741f41b89')
sha256sums_x86_64=('3657b4f5d0d29ad1917a0476d97e07cfee76cfc2532c635566a6025b0297e1c5')
source=("bilibili.svg::https://raw.githubusercontent.com/wings1848/bilibili-linux/v${pkgver}-1/res/icons/bilibili.svg")
install="${pkgname}.install"

package() {
  cd "${srcdir}"

  # Extract the pre-built release tarball
  # Structure: bin/bilibili (launcher), app/ (app.asar), electron/ (Electron 43 runtime)
  # NOTE: tar.gz has no top-level directory, extracts directly into srcdir
  install -dm755 "${pkgdir}/opt/bilibili" "${pkgdir}/usr/bin"
  cp -r bin app electron "${pkgdir}/opt/bilibili/"
  # Remove the tarball's launcher script — wrapper replaces it entirely
  rm -f "${pkgdir}/opt/bilibili/bin/bilibili"

  # Install .desktop file (tar.gz doesn't ship one — electron-builder
  # only embeds it in the AppImage, not in the tarball)
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << DESKTOP
[Desktop Entry]
Name=Bilibili
Name[zh_CN]=哔哩哔哩
Name[zh_TW]=嗶哩嗶哩
Exec=/usr/bin/bilibili %U
Terminal=false
Type=Application
Icon=bilibili
StartupWMClass=bilibili
Comment=BiliBili client for Linux (GPU accelerated, Electron 43)
Comment[zh_CN]=哔哩哔哩桌面版
Comment[zh_TW]=嗶哩嗶哩桌面版
Categories=AudioVideo;Video;TV;
Keywords=animation;anime;drama;live;movie;player;tv;video;bilibili;
Keywords[zh_CN]=B站;播放器;动画;动漫;电影;番剧;视频;直播;
Keywords[zh_TW]=B站;播放器;動畫;動漫;电影;番劇;視頻;直播;
StartupNotify=true
SingleMainWindow=true
DESKTOP

  # Install icon
  install -Dm644 "${srcdir}/bilibili.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bilibili.svg"

  # Create wrapper script for /usr/bin/bilibili
  # Auto-detects GPU at runtime and applies matching video decode flags.
  # User flags from ~/.config/bilibili/bilibili-flags.conf are appended
  # AFTER defaults — override via Chromium last-wins semantics.
  cat > "${pkgdir}/opt/bilibili/${pkgname}.wrapper" << 'WRAPPER'
#!/bin/bash
set -e
root_dir="/opt/bilibili"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export NODE_ENV=production
# Wayland auto-detect — prefers Wayland when available
export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"

# Correct taskbar icon grouping (literal value — heredoc is single-quoted)
export CHROME_DESKTOP="bilibili-gpu-bin.desktop"

# Trash integration
case "${XDG_CURRENT_DESKTOP}" in
    *KDE*) export ELECTRON_TRASH="kioclient5" ;;
    *GNOME*) export ELECTRON_TRASH="gio" ;;
    *XFCE*) export ELECTRON_TRASH="gvfs-trash" ;;
esac

# === GPU acceleration flags ===
# Common flags — safe and beneficial for all GPUs (Intel/AMD/NVIDIA).
# No ANGLE override: let Electron use its default GL backend
# (EGL on Wayland, GLX on X11, D3D11 on Windows).
declare -a DEFAULT_FLAGS=(
    --ignore-gpu-blocklist
    --enable-gpu-rasterization
    --enable-zero-copy
    --disable-gpu-sandbox
)

# Auto-detect GPU vendor and apply matching video decode feature flags.
# Uses /proc/driver/nvidia (exists iff the NVIDIA kernel module is loaded)
# — zero extra dependencies, no pciutils needed.
if [[ -d /proc/driver/nvidia ]]; then
    # NVIDIA: VA-API → libva-nvidia-driver → NVDEC
    # Must set LIBVA_DRIVER_NAME or libva won't find the NVIDIA backend
    export LIBVA_DRIVER_NAME=nvidia
    DEFAULT_FLAGS+=(
        --enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoDecodeLinuxZeroCopyGL,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,PlatformHEVCDecoderSupport
    )
else
    # Intel / AMD / other: standard VA-API path (Mesa Gallium)
    DEFAULT_FLAGS+=(
        --enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoDecodeLinuxZeroCopyGL,VaapiVideoDecoder,VaapiVideoEncoder,VaapiIgnoreDriverChecks,PlatformHEVCDecoderSupport
    )
fi

# Load user-defined flags from config file.
# Appended AFTER defaults — Chromium's last-wins semantics let users
# override individual flags. --enable-features is cumulative across
# multiple occurrences, so user features add to (not replace) defaults.
# Search order: app's userData path (matches electron-tool.ts) →
# legacy path → flat fallback.
declare -a flags
for f in "${XDG_CONFIG_HOME}/bilibili-linux/bilibili-flags.conf" \
         "${XDG_CONFIG_HOME}/bilibili/bilibili-flags.conf" \
         "${XDG_CONFIG_HOME}/bilibili-flags.conf"; do
  if [[ -f "$f" ]]; then
    while IFS= read -r line; do
      [[ "$line" =~ ^[[:space:]]*# ]] || [[ -z "$line" ]] || {
        read -ra parts <<< "$line"
        flags+=("${parts[@]}")
      }
    done < "$f"
  fi
done

# Strip known-harmful flags that linger in old configs (pkgrel ≤7).
# --use-gl=angle / --use-angle=gl break VA-API on Intel/AMD Wayland
# and are no longer needed on any platform with Electron 43+.
for i in "${!flags[@]}"; do
  case "${flags[$i]}" in
    --use-gl=angle|--use-angle=gl|--use-gl|--use-angle)
      unset 'flags[$i]' ;;
  esac
done
flags=("${flags[@]}")

# --no-sandbox when running as root
_SANDBOX_ARG=()
if [[ $EUID -eq 0 ]] && [[ "${ELECTRON_RUN_AS_NODE}" != "1" ]]; then
  _SANDBOX_ARG=("--no-sandbox")
fi

exec "${root_dir}/electron/electron" "${root_dir}/app/app.asar" \
  "${DEFAULT_FLAGS[@]}" "${flags[@]}" "${_SANDBOX_ARG[@]}" "$@"
WRAPPER
  chmod 755 "${pkgdir}/opt/bilibili/${pkgname}.wrapper"

  # Symlink /usr/bin/bilibili → wrapper
  ln -sf "/opt/bilibili/${pkgname}.wrapper" "${pkgdir}/usr/bin/bilibili"

  # Install default flags config template to the app's userData directory
  # (matches package.json "name": "bilibili-linux" → ~/.config/bilibili-linux/)
  # GPU-specific video decode flags are auto-detected by the wrapper at runtime;
  # this file provides only the safe common baseline. Users may add custom flags
  # here — they are appended after defaults and override via last-wins semantics.
  install -dm755 "${pkgdir}/etc/skel/.config/bilibili-linux"
  cat > "${pkgdir}/etc/skel/.config/bilibili-linux/bilibili-flags.conf" << 'FLAGS'
--ignore-gpu-blocklist
--enable-gpu-rasterization
--enable-zero-copy
--disable-gpu-sandbox
FLAGS
}
