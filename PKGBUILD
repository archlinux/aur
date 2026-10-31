# Maintainer: jarbowski <jarbowski@example.com>
pkgname=tape16-bin
pkgver=0.9.530
pkgrel=3
pkgdesc="Destructive tape-style 16-track DAW (X11-backed, XWayland on Wayland sessions)"
arch=('x86_64')
url="https://emrmusicgroup.com/tape16/"
license=('LicenseRef-proprietary')
groups=('pro-audio')
depends=(
  hicolor-icon-theme
  bash
  glibc
  libstdc++
  libgcc
  alsa-lib
  curl
  fontconfig
  freetype2
  libx11
  'libjack.so=0-64'
)
makedepends=('unzip')
optdepends=(
  'wireplumber: recommended audio session manager'
  'xorg-xwayland: XWayland for plugin editors and Wayland sessions'
  'realtime-privileges: realtime scheduling for low latency'
  'xdg-desktop-portal: portal integration'
  'yabridge: Windows VST via Wine'
  'wine: Windows VST host support'
)
provides=('tape16')
conflicts=('tape16' 'tape16-wayland-bin' 'tape16-x11-bin')
options=('!strip' '!debug')
install=tape16-bin.install
source=("TAPE-16-v${pkgver}-Linux-Release.zip::https://github.com/jackpaterson1/TAPE-16-Public-Releases/releases/download/${pkgver}/TAPE-16-v${pkgver}-Linux-Release.zip")
sha256sums=('8470388e51acbfc3ff38a3f90fc81758249c867201b04cbb4900008ec8fd03a4')

package() {
  # Note: upstream folder is TAPE-16-v${pkgver}-10-Linux-Release (extra -10)
  local deb="${srcdir}/TAPE-16-v${pkgver}-10-Linux-Release/TAPE 16 Wayland Deb/INSTALL-TAPE16.deb"
  local extract="${srcdir}/deb-extract"

  mkdir -p "$extract"

  # .deb is an ar archive; extract data.tar.* then its content
  bsdtar -xOf "$deb" data.tar.* | bsdtar -x -C "$extract"

  # App + resources
  install -dm755 "${pkgdir}/usr/lib"
  cp -a "${extract}/usr/lib/tape16" "${pkgdir}/usr/lib/"

  # Share data
  install -dm755 "${pkgdir}/usr/share"
  for d in icons applications metainfo doc tape16; do
    if [[ -d "${extract}/usr/share/$d" ]]; then
      cp -a "${extract}/usr/share/$d" "${pkgdir}/usr/share/"
    fi
  done

  # Keep only useful helpers
  install -Dm755 "${extract}/usr/bin/tape16-plugin-doctor" "${pkgdir}/usr/bin/tape16-plugin-doctor"
  install -Dm755 "${extract}/usr/bin/tape16-reset-defaults" "${pkgdir}/usr/bin/tape16-reset-defaults"

  # Single launcher
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/tape16" << 'LAUNCHER'
#!/usr/bin/env bash
set -u

APP_DIR=/usr/lib/tape16
APP_BIN="$APP_DIR/TAPE 16"
SHARE_DIR=/usr/share/tape16

# Detect session
session_type="${XDG_SESSION_TYPE:-}"
session_type="$(printf '%s' "$session_type" | tr '[:upper:]' '[:lower:]')"
if [[ -z "$session_type" ]]; then
  if [[ -n "${WAYLAND_DISPLAY:-}" ]]; then
    session_type=wayland
  elif [[ -n "${DISPLAY:-}" ]]; then
    session_type=x11
  else
    session_type=x11
  fi
fi

# Source matching profile
profile_env="$SHARE_DIR/profiles/tape16-${session_type}.env"
[[ -r "$profile_env" ]] && . "$profile_env"

# Export profile vars
export TAPE16_PACKAGE_PROFILE TAPE16_PACKAGE_PROFILE_LABEL
export TAPE16_DISPLAY_PROFILE TAPE16_EXPECT_SESSION
export TAPE16_GRAPHICS_PROFILE TAPE16_REPAINT_PROFILE
export TAPE16_SAMPLE_RATE TAPE16_STABLE_BLOCK_SIZE TAPE16_LOWLATENCY_BLOCK_SIZE
export TAPE16_PWJACK_FLAGS_FIRST TAPE16_PREFER_NATIVE_WAYLAND
export TAPE_LINUX_USE_VBLANK TAPE_LINUX_DISABLE_WAYLAND_BLIT_RELIEF
export TAPE_LINUX_ENABLE_STABLE_REEL_RESIDUAL TAPE_LINUX_X11_REEL_PREWARM

# Forced settings
export TAPE16_AUDIO_AUTHORITY=tape16
export TAPE16_FILE_CHOOSER=internal
export TAPE16_REMOTE_LAN=1
export GDK_BACKEND=x11,wayland

if [[ "$session_type" == wayland && -n "${DISPLAY:-}" ]]; then
  export TAPE16_LINUX_DISPLAY_MODE=wayland-xwayland
fi

exec "$APP_BIN" "$@"
LAUNCHER

  # Single desktop entry: "TAPE 16" (no Wayland/X11 suffix)
  desktop="${pkgdir}/usr/share/applications/tape16.desktop"
  if [[ -f "$desktop" ]]; then
    sed -i \
      -e 's|^Name=.*|Name=TAPE 16|' \
      -e 's|^Comment=.*|Comment=16-track destructive tape-style DAW|' \
      -e 's|^Exec=.*|Exec=/usr/bin/tape16 %U|' \
      "$desktop"
  fi
  rm -f "${pkgdir}/usr/share/applications/tape16-lowlatency.desktop"
}
