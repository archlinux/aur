# Maintainer: Spyro24 <minerpi16@gmail.com>
pkgname=ustoat
pkgver=0.4.0
pkgrel=1
pkgdesc="UStoat — A custom stoat client writen in python with the use of pygame-ce"
url="https://github.com/Spyro24/UStoat"
license=(GPL)
arch=(x86_64)
depends=(python python-pip)
makedepends=(imagemagick)
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://github.com/Spyro24/UStoat/archive/refs/tags/V-${pkgver}.zip")
sha512sums=('SKIP')

build() {
  cd "$srcdir/UStoat-V-${pkgver}" || return 1
  return 0
}

package() {
  cd "$srcdir/UStoat-V-${pkgver}" || return 1

  # Install Python requirements (if present)
  if [[ -f requirements.txt ]]; then
    python -m pip install -r requirements.txt
  fi

  # License (if present)
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true

  # Copy repository files into /usr/lib/$pkgname so desktop wrapper can run main.pyw
  appdir="$pkgdir/usr/lib/$pkgname"
  mkdir -p "$appdir"
  cp -a ./* "$appdir/"

  # Wrapper executable
  install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname"
  cat > "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
exec python /usr/lib/ustoat/main.pyw "$@"
EOF

  # Desktop file
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=UStoat
Comment=UStoat Client
Exec=/usr/bin/ustoat
Icon=ustoat
Terminal=false
Categories=Utility;
EOF

  # Install icon: res/icons/app_icon_x384.png -> hicolor 256x256 and 48x48
  if [[ -f "res/icons/app_icon_x384.png" ]]; then
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    install -d "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    if command -v convert >/dev/null 2>&1; then
      convert "res/icons/app_icon_x384.png" -resize 256x256 "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
      convert "res/icons/app_icon_x384.png" -resize 48x48 "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
    else
      cp "res/icons/app_icon_x384.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
      cp "res/icons/app_icon_x384.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
    fi
  fi
}
