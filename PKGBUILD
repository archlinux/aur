_force_test_ts=20260205064040
# Maintainer: <your name> <your email>

# Ensure UTF-8 locale for files with non-ASCII names during packaging.
export LANG=C.UTF-8
export LC_ALL=C.UTF-8

pkgname=layaair-ide
pkgver=3.4.0_beta.1
_upstream_ver=3.4.0-beta.1
_url=https://ldc-1251285021.file.myqcloud.com/layaair3/layaair-3.4/linux/LayaAirIDE-linux-x86_64-3.4.0-beta.1.AppImage
pkgrel=1
pkgdesc='LayaAir IDE (repacked from official AppImage)'
arch=('x86_64')
url='https://layaair.com/'
license=('custom')
install="${pkgname}.install"
source=("LayaAirIDE.AppImage::$_url")
sha256sums=('c3a5ecb7668814aed4939b0bf8f3a0472d976f8c308b6de384d1b181488db8a4')

prepare() {
  cd "$srcdir"
  rm -rf squashfs-root
  chmod +x LayaAirIDE.AppImage
  ./LayaAirIDE.AppImage --appimage-extract >/dev/null

  local desktop_src
  desktop_src=$(find squashfs-root -type f -name '*.desktop' -print -quit || true)

  if [[ -n "$desktop_src" ]]; then
    cp "$desktop_src" "$srcdir/layaair-ide.desktop"
  else
    cat > "$srcdir/layaair-ide.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=LayaAir IDE
Exec=layaair-ide
Icon=layaair-ide
Categories=Development;IDE;
Terminal=false
DESKTOP
  fi

  # Force wrapper script execution.
  sed -i 's/^Exec=.*/Exec=layaair-ide/' "$srcdir/layaair-ide.desktop"

  # If Icon is a path or a filename, normalize to layaair-ide and stash a copy.
  if grep -Eq '^Icon=.+/' "$srcdir/layaair-ide.desktop" || grep -Eq '^Icon=.+\.png$' "$srcdir/layaair-ide.desktop"; then
    sed -i 's/^Icon=.*/Icon=layaair-ide/' "$srcdir/layaair-ide.desktop"

    local icon_src=""
    local icon_size=""
    for size in 512x512 256x256 128x128 64x64 48x48 32x32 24x24 16x16; do
      icon_src=$(find squashfs-root/usr/share/icons -path "*/hicolor/${size}/apps/*.png" -print -quit 2>/dev/null || true)
      if [[ -n "$icon_src" ]]; then
        icon_size="$size"
        break
      fi
    done
    if [[ -z "$icon_src" ]]; then
      icon_src=$(find squashfs-root -type f -name '*.png' -print -quit 2>/dev/null || true)
      icon_size="256x256"
    fi
    if [[ -n "$icon_src" ]]; then
      cp "$icon_src" "$srcdir/layaair-ide.png"
      echo "$icon_size" > "$srcdir/layaair-ide.icon-size"
    fi
  fi

  if ! grep -q '^Name=' "$srcdir/layaair-ide.desktop"; then
    echo 'Name=LayaAir IDE' >> "$srcdir/layaair-ide.desktop"
  fi
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/layaair-ide"
  cp -a squashfs-root/. "$pkgdir/opt/layaair-ide/"
  chmod -R a+rX "$pkgdir/opt/layaair-ide"
  if [[ -f "$pkgdir/opt/layaair-ide/AppRun" ]]; then
    chmod 755 "$pkgdir/opt/layaair-ide/AppRun"
  fi

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/layaair-ide" <<'EOF_WRAPPER'
#!/bin/sh
exec /opt/layaair-ide/AppRun "$@"
EOF_WRAPPER

  install -Dm644 "$srcdir/layaair-ide.desktop" "$pkgdir/usr/share/applications/layaair-ide.desktop"

  if [[ -d squashfs-root/usr/share/icons ]]; then
    install -d "$pkgdir/usr/share"
    cp -r squashfs-root/usr/share/icons "$pkgdir/usr/share/"
    find "$pkgdir/usr/share/icons" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/icons" -type f -exec chmod 644 {} +
  fi

  if [[ -f "$srcdir/layaair-ide.png" ]]; then
    local icon_size
    icon_size=$(cat "$srcdir/layaair-ide.icon-size" 2>/dev/null || echo '256x256')
    install -Dm644 "$srcdir/layaair-ide.png" \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}/apps/layaair-ide.png"
  fi
}
