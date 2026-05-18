# Maintainer: Spyro24 <minerpi16@gmail.com>
export DEBUGPKG=0
pkgname=ustoat
pkgver=0.3.4
pkgrel=1
pkgdesc="UStoat — A custom stoat client written in python with the use of pygame-ce"
url="https://github.com/Spyro24/UStoat"
license=(GPL)
arch=(x86_64)
depends=(python tk)
makedepends=(git imagemagick python-virtualenv)
optdepends=()
provides=()
conflicts=()
replaces=()
source=("git+https://github.com/Spyro24/UStoat.git")
sha512sums=('SKIP')

build() {
  cd "$srcdir/UStoat" || return 1
  return 0
}

package() {
  cd "$srcdir/UStoat" || return 1

  appdir="$pkgdir/usr/lib/$pkgname"
  mkdir -p "$appdir"
  cp -a "$srcdir/UStoat/." "$appdir/"

  # create venv and install requirements (including recursive deps)
  python -m venv "$appdir/venv"
  "$appdir/venv/bin/python" -m pip install --upgrade pip setuptools wheel
  if [[ -f "$appdir/requirements.txt" ]]; then
    "$appdir/venv/bin/pip" install -r "$appdir/requirements.txt"
  fi

  # wrapper that activates venv and runs main.pyw
  install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname"
  cat > "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
VENV="/usr/lib/ustoat/venv"
export PATH="$VENV/bin:$PATH"
exec python /usr/lib/ustoat/main.pyw "$@"
EOF

  # desktop file
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=UStoat
Exec=/usr/bin/ustoat
Icon=ustoat
Terminal=false
Categories=Utility;
EOF

  # install icon and license
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps" "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  if [[ -f "$srcdir/UStoat/res/icons/app_icon_x384.png" ]]; then
    if command -v convert >/dev/null 2>&1; then
      convert "$srcdir/UStoat/res/icons/app_icon_x384.png" -resize 256x256 "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
      convert "$srcdir/UStoat/res/icons/app_icon_x384.png" -resize 48x48 "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
    else
      cp "$srcdir/UStoat/res/icons/app_icon_x384.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
      cp "$srcdir/UStoat/res/icons/app_icon_x384.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
    fi
  fi

  install -Dm644 "$srcdir/UStoat/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true
}

