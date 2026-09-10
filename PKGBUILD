# Maintainer: jarbowski <jarbowski@laposte.net>
pkgname=tape16-bin
pkgver=0.9.380
pkgrel=1
pkgdesc="Destructive tape-style DAW (X11-backed, XWayland on Wayland sessions)"
arch=('x86_64')
url="https://emrmusicgroup.com/tape16/"
license=('LicenseRef-proprietary')
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
optdepends=(
  'pipewire-jack: JACK via PipeWire (recommended by upstream)'
  'wireplumber: PipeWire session manager'
  'jack2: classic JACK server'
  'xorg-xwayland: required on Wayland sessions (app runs via XWayland)'
  'realtime-privileges: realtime group and limits for low-latency audio'
  'xdg-desktop-portal: file dialogs on Wayland'
  'yabridge: Windows VST via Wine'
  'wine: Windows VST support'
)
provides=('tape16')
conflicts=('tape16' 'tape16-x11-bin' 'tape16-wayland-bin')
install=tape16-bin.install
options=(!strip !debug)
makedepends=(unzip)

source=("TAPE-16-v${pkgver}-Linux-Release.zip::https://github.com/jackpaterson1/TAPE-16-Public-Releases/releases/download/${pkgver}/TAPE-16-v${pkgver}-Linux-Release.zip")
sha256sums=('3369eeda300a4f6598f27986f5e77d998f973da0201aa9a5788e486aebda36f7')

prepare() {
  unzip -o "TAPE-16-v${pkgver}-Linux-Release.zip"
  ar x "TAPE-16-v${pkgver}-Linux-Release/TAPE 16 Wayland Deb/INSTALL-TAPE16.deb"
}

package() {
  if [ ! -f data.tar.zst ]; then
    echo "ERROR: data.tar.zst not found"
    exit 1
  fi
  bsdtar -x --zstd -f data.tar.zst -C "$pkgdir"

  # Debian PAM limits → use realtime-privileges instead
  rm -rf "$pkgdir/etc"

  # Debian-oriented wrappers / helpers
  rm -f \
    "$pkgdir/usr/bin/tape16" \
    "$pkgdir/usr/bin/tape16-lowlatency" \
    "$pkgdir/usr/bin/tape16-stable" \
    "$pkgdir/usr/bin/tape16-create-desktop-copy" \
    "$pkgdir/usr/bin/tape16-preflight" \
    "$pkgdir/usr/bin/tape16-system-check"

  rm -f "$pkgdir/usr/share/tape16/scripts/linux-runtime-preflight.sh"
  rmdir "$pkgdir/usr/share/tape16/scripts" 2>/dev/null || true
  rmdir "$pkgdir/usr/lib/tape16/Resources/GUI/Meters/Faders" 2>/dev/null || true

  # Frozen Debian profile; session is selected by our launcher
  rm -f "$pkgdir/usr/share/tape16/profile.env"

  chmod +x "$pkgdir/usr/bin/tape16-plugin-doctor" 2>/dev/null || true
  chmod +x "$pkgdir/usr/bin/tape16-reset-defaults" 2>/dev/null || true
  chmod 755 "$pkgdir/usr/lib/tape16/TAPE 16" 2>/dev/null || true

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/tape16" << 'EOF'
#!/bin/bash
set -u

case "${XDG_SESSION_TYPE:-}" in
  wayland) _env=/usr/share/tape16/profiles/wayland.env ;;
  *)       _env=/usr/share/tape16/profiles/x11.env ;;
esac
# shellcheck disable=SC1090
[ -r "$_env" ] && . "$_env"

export TAPE16_AUDIO_AUTHORITY="${TAPE16_AUDIO_AUTHORITY:-tape16}"
export TAPE16_REMOTE_LAN="${TAPE16_REMOTE_LAN:-1}"
export GDK_BACKEND="${GDK_BACKEND:-x11,wayland}"

exec "/usr/lib/tape16/TAPE 16" "$@"
EOF

  rm -f "$pkgdir/usr/share/applications/tape16-lowlatency.desktop"
  if [ -f "$pkgdir/usr/share/applications/tape16.desktop" ]; then
    sed -i 's|^Exec=.*|Exec=tape16|' "$pkgdir/usr/share/applications/tape16.desktop"
    sed -i 's|^TryExec=.*|TryExec=tape16|' "$pkgdir/usr/share/applications/tape16.desktop"
    sed -i 's|^Name=.*|Name=TAPE 16|' "$pkgdir/usr/share/applications/tape16.desktop"
  fi
  
  if [ -f "$pkgdir/usr/share/metainfo/com.jackpaterson.tapedaw.metainfo.xml" ]; then
    sed -i 's/Package profile: Linux Wayland\./Package profile: Linux./' \
      "$pkgdir/usr/share/metainfo/com.jackpaterson.tapedaw.metainfo.xml"
  fi

  if [ -f "$pkgdir/usr/lib/tape16/Resources/EULA.txt" ]; then
    install -Dm644 "$pkgdir/usr/lib/tape16/Resources/EULA.txt" \
      "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
  fi
}
