
pkgname=yt-dlp-gui
pkgver=r5.d6d0f8a
pkgrel=1
pkgdesc="A modern Qt6 GUI for yt-dlp"
arch=('x86_64')
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

source=()
sha256sums=()

pkgver() {
  cd "$startdir"
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
  else
    printf "r0.local"
  fi
}

package() {
  cd "$startdir"

  if [[ ! -d src/ui ]]; then
    echo "ERROR: src/ui not found in working tree."
    exit 1
  fi

  install -dm755 "$pkgdir/usr/share/yt-dlp-gui"
  cp -r src assets main.py requirements.txt "$pkgdir/usr/share/yt-dlp-gui"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/yt-dlp-gui" <<'EOF'
#!/usr/bin/env bash
exec /usr/bin/python /usr/share/yt-dlp-gui/main.py "$@"
EOF

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/yt-dlp-gui.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=yt-dlp-gui
Comment=GUI frontend for yt-dlp
Exec=yt-dlp-gui
Icon=/usr/share/pixmaps/yt-dlp-gui.ico
Categories=AudioVideo;Network;
Terminal=false
StartupNotify=true
EOF

  if [[ -f src/img/logo.ico ]]; then
    install -Dm644 src/img/logo.ico "$pkgdir/usr/share/pixmaps/yt-dlp-gui.ico"
  elif [[ -f assets/img/logo.ico ]]; then
    install -Dm644 assets/img/logo.ico "$pkgdir/usr/share/pixmaps/yt-dlp-gui.ico"
  else
    echo "warning: logo.ico not found in src/img or assets/img"
  fi
}
