pkgname=yt-dlp-gui
pkgver=r20.db8f441
pkgrel=1
pkgdesc="A modern Qt6 GUI for yt-dlp"
arch=('any')
url="https://github.com/enesehs/yt-dlp-gui"
license=('MIT')

depends=(
  'python'
  'pyside6'
  'python-requests'
  'yt-dlp'
  'ffmpeg'
)

makedepends=('git')

provides=('yt-dlp-gui')
conflicts=('yt-dlp-gui')

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  local app_root="."
  local fallback_root="pkg/$pkgname/usr/share/$pkgname"

  if [[ -d src/ui ]]; then
    app_root="."
  elif [[ -d "$fallback_root/src/ui" ]]; then
    app_root="$fallback_root"
  else
    echo "ERROR: src/ui not found in working tree."
    exit 1
  fi

  install -dm755 "$pkgdir/usr/share/yt-dlp-gui"
  cp -r "$app_root/src" "$app_root/assets" "$app_root/main.py" "$app_root/requirements.txt" "$pkgdir/usr/share/yt-dlp-gui/"

  install -dm755 "$pkgdir/usr/bin"
  cat <<'EOF' > "$pkgdir/usr/bin/yt-dlp-gui"
#!/usr/bin/env bash
exec /usr/bin/python /usr/share/yt-dlp-gui/main.py "$@"
EOF
  chmod +x "$pkgdir/usr/bin/yt-dlp-gui"

  install -dm755 "$pkgdir/usr/share/applications"
  cat <<'EOF' > "$pkgdir/usr/share/applications/yt-dlp-gui.desktop"
[Desktop Entry]
Type=Application
Name=yt-dlp-gui
Comment=GUI frontend for yt-dlp
Exec=yt-dlp-gui
Icon=yt-dlp-gui
Categories=AudioVideo;Network;
Terminal=false
StartupNotify=true
EOF

  install -dm755 "$pkgdir/usr/share/pixmaps"
  if [[ -f "$app_root/src/img/logo.ico" ]]; then
    install -Dm644 "$app_root/src/img/logo.ico" "$pkgdir/usr/share/pixmaps/yt-dlp-gui.ico"
  elif [[ -f "$app_root/assets/img/logo.ico" ]]; then
    install -Dm644 "$app_root/assets/img/logo.ico" "$pkgdir/usr/share/pixmaps/yt-dlp-gui.ico"
  else
    echo "warning: logo.ico not found in src/img or assets/img"
  fi
}
