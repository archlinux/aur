# Maintainer: Mazlum <https://github.com/MrMazlum/Earshot>
# Earshot -bin: prebuilt release binaries, no compile. Version is bumped on
# every GitHub release by CI. For "latest commit every install", use
# earshot-git instead.
pkgname=earshot-bin
_pkgname=earshot
pkgver=1.1.0
pkgrel=1
pkgdesc="Use your phone as your PC's microphone, over Wi-Fi (prebuilt release)"
arch=('x86_64')
url="https://github.com/MrMazlum/Earshot"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'dbus' 'hicolor-icon-theme')
optdepends=(
  'pulseaudio-utils: virtual microphone via pactl (PulseAudio)'
  'pipewire-pulse: virtual microphone via pactl (PipeWire)'
  'gnome-shell-extension-appindicator: tray icon on GNOME'
)
provides=('earshot')
conflicts=('earshot' 'earshot-git')
source=("https://github.com/MrMazlum/Earshot/releases/download/v${pkgver}/earshot-receiver-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  # Release tarballs wrap the files in one top-level dir; find them.
  receiver=$(find "$srcdir" -name earshot-receiver -type f | head -1)
  tray=$(find "$srcdir" -name earshot-tray -type f | head -1)
  [ -n "$receiver" ] && [ -n "$tray" ] || { echo "binaries not found in tarball"; return 1; }
  install -Dm0755 "$receiver" "$pkgdir/usr/bin/earshot-receiver"
  install -Dm0755 "$tray" "$pkgdir/usr/bin/earshot-tray"
  # Desktop + icon ship in the repo, not the tarball: fetch is avoided by
  # generating the freedesktop entry here (identical to packaging/earshot.desktop).
  install -dm0755 "$pkgdir/usr/share/applications" "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  cat > "$pkgdir/usr/share/applications/earshot.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Earshot
GenericName=Phone microphone bridge
Comment=Use your phone as this machine's microphone
Exec=earshot-tray
Icon=earshot
Terminal=false
Categories=AudioVideo;Audio;
StartupNotify=false
EOF
}
