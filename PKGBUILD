# Maintainer: wingsbutterfly <wingsbutterfly@users.noreply.github.com>
# Contributor: msojocs <jiyecafe@gmail.com>
#
# NVIDIA GPU acceleration fork — Electron 43 (Chromium 150) + VaapiOnNvidiaGPUs
# for NVDEC hardware video decode on NVIDIA GPUs under Wayland.
# Original upstream: https://github.com/msojocs/bilibili-linux
# Fork: https://github.com/wings1848/bilibili-linux

pkgname=bilibili-gpu-bin
_pkgreal=bilibili
pkgver=1.17.9
pkgrel=7
pkgdesc="Bilibili client for Linux (Electron 43, NVIDIA GPU acceleration fork)"
arch=('x86_64')
url="https://github.com/wings1848/bilibili-linux"
license=('MIT')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libva'
  'libva-nvidia-driver'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'cups'
  'libxkbcommon'
  'mesa'
  'alsa-lib'
)
optdepends=(
  'python-faster-whisper: AI subtitle transcription'
)
conflicts=('bilibili' 'bilibili-bin')
provides=("${_pkgreal}=${pkgver}")
source_x86_64=("${_pkgreal}-v${pkgver}-1-x64.tar.gz::${url}/releases/download/v${pkgver}-1/bilibili-v${pkgver}-1-x64.tar.gz")
sha256sums_x86_64=('SKIP')
source=("bilibili.svg::https://raw.githubusercontent.com/wings1848/bilibili-linux/v${pkgver}-1/res/icons/bilibili.svg")
sha256sums=('SKIP')

package() {
  cd "${srcdir}"

  # Extract the pre-built release tarball
  # Structure: bin/bilibili (launcher), app/ (app.asar), electron/ (Electron 43 runtime)
  # NOTE: tar.gz has no top-level directory, extracts directly into srcdir
  install -dm755 "${pkgdir}/opt/bilibili" "${pkgdir}/usr/bin"
  cp -r bin app electron "${pkgdir}/opt/bilibili/"

  # Install .desktop file (tar.gz doesn't ship one — electron-builder
  # only embeds it in the AppImage, not in the tarball)
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << DESKTOP
[Desktop Entry]
Name=bilibili
Exec=/usr/bin/bilibili %U
Terminal=false
Type=Application
Icon=bilibili
StartupWMClass=bilibili
Comment=BiliBili client for Linux (GPU accelerated, Electron 43).
Categories=AudioVideo;
DESKTOP

  # Install icon
  install -Dm644 "${srcdir}/bilibili.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/bilibili.svg"

  # Create wrapper script for /usr/bin/bilibili
  # Loads user flags, sets Wayland/DE environment, then launches Electron
  cat > "${pkgdir}/opt/bilibili/${pkgname}.wrapper" << 'WRAPPER'
#!/bin/bash
set -e
root_dir="/opt/bilibili"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export NODE_ENV=production
export APPIMAGE=1  # enable update check

# Wayland auto-detect
export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"

# Correct taskbar icon grouping
export CHROME_DESKTOP="${pkgname}.desktop"

# Trash integration
case "${XDG_CURRENT_DESKTOP}" in
    KDE) export ELECTRON_TRASH="kioclient5" ;;
    GNOME) export ELECTRON_TRASH="gio" ;;
    XFCE) export ELECTRON_TRASH="gvfs-trash" ;;
esac

# Load user-defined GPU/flags configuration
declare -a flags
for f in "${XDG_CONFIG_HOME}/bilibili/bilibili-flags.conf" \
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

# --no-sandbox when running as root
_SANDBOX_ARG=()
if [[ $EUID -eq 0 ]] && [[ "${ELECTRON_RUN_AS_NODE}" != "1" ]]; then
  _SANDBOX_ARG=("--no-sandbox")
fi

exec "${root_dir}/electron/electron" "${root_dir}/app/app.asar" \
  "${flags[@]}" "${_SANDBOX_ARG[@]}" "$@"
WRAPPER
  chmod 755 "${pkgdir}/opt/bilibili/${pkgname}.wrapper"

  # Symlink /usr/bin/bilibili → wrapper
  ln -sf "/opt/bilibili/${pkgname}.wrapper" "${pkgdir}/usr/bin/bilibili"

  # Install default flags config for NVIDIA GPU acceleration
  install -dm755 "${pkgdir}/etc/skel/.config/bilibili"
  cat > "${pkgdir}/etc/skel/.config/bilibili/bilibili-flags.conf" << 'FLAGS'
--ignore-gpu-blocklist
--use-gl=angle
--use-angle=gl
--enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoDecodeLinuxZeroCopyGL,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,PlatformHEVCDecoderSupport
--enable-gpu-rasterization
--enable-zero-copy
--disable-gpu-sandbox
FLAGS
}
