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
pkgrel=3
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
source_x86_64=("${_pkgreal}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}-1/bilibili-${pkgver}-x86_64.AppImage")
sha256sums_x86_64=('SKIP')

package() {
  cd "${srcdir}"

  # Extract AppImage
  chmod +x "${_pkgreal}-${pkgver}-x86_64.AppImage"
  "./${_pkgreal}-${pkgver}-x86_64.AppImage" --appimage-extract

  # Install main app bundle to /opt/bilibili
  install -dm755 "${pkgdir}/opt/bilibili" "${pkgdir}/usr/bin"
  cp -r squashfs-root/* "${pkgdir}/opt/bilibili/"

  # Install icons to XDG standard paths
  # These come from the AppImage's embedded usr/share/icons/ hierarchy
  find squashfs-root/usr/share/icons/ -type f | while read -r icon; do
    install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/${icon#squashfs-root/usr/share/icons/}"
  done

  # Install .desktop file so the app appears in system menu
  install -Dm644 squashfs-root/bilibili.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=/usr/bin/bilibili %U|' \
    -e '/^X-AppImage/d' \
    -e "s|^Icon=.*|Icon=${_pkgreal}|" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Create wrapper script (handles flags loading, Wayland env, etc.)
  install -dm755 "${pkgdir}/opt/bilibili"
  cat > "${pkgdir}/opt/bilibili/${pkgname}.wrapper" << 'WRAPPER'
#!/bin/bash
set -e
export APPDIR="/opt/bilibili"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export NODE_ENV=production

# Wayland support (auto-detect between X11/Wayland)
export ELECTRON_OZONE_PLATFORM_HINT="${ELECTRON_OZONE_PLATFORM_HINT:-auto}"

# Correct taskbar icon grouping
export CHROME_DESKTOP="bilibili-gpu-bin.desktop"

# Desktop Environment trash integration
case "${XDG_CURRENT_DESKTOP}" in
    KDE) export ELECTRON_TRASH="kioclient5" ;;
    GNOME) export ELECTRON_TRASH="gio" ;;
    XFCE) export ELECTRON_TRASH="gvfs-trash" ;;
esac

# Load user-defined GPU/flags configuration
# Priority: ~/.config/bilibili/bilibili-flags.conf > ~/.config/bilibili-flags.conf
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

cd "${APPDIR}" || exit 1
exec ./AppRun "${flags[@]}" "${_SANDBOX_ARG[@]}" "$@"
WRAPPER
  chmod 755 "${pkgdir}/opt/bilibili/${pkgname}.wrapper"

  # Symlink /usr/bin/bilibili → wrapper
  ln -sf "/opt/bilibili/${pkgname}.wrapper" "${pkgdir}/usr/bin/bilibili"

  # Install default flags config for NVIDIA GPU acceleration
  # (copied to /etc/skel so new users get it automatically)
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
