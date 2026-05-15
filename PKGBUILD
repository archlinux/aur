# Maintainer: asuka minato

pkgname=syncless-bin
pkgver=0.0.63
pkgrel=1
pkgdesc='Syncless desktop client, repackaged to run with system Electron'
arch=('x86_64')
url='https://syncless.ai/'
license=('custom')
depends=('electron41' tmux)
makedepends=('p7zip' 'asar')
provides=('syncless')
conflicts=('syncless')
source=('desktop-windows-latest.exe::https://artifacts.syncless.ai/downloads/desktop-windows-latest.exe')
sha256sums=('7affc26f6f30be585147a7e17ad2901ed235a571cf618d362db546b2b49a92dd')

prepare() {
  rm -rf "$srcdir/exe" "$srcdir/app"
  mkdir -p "$srcdir/exe" "$srcdir/app"

  7z x "$srcdir/desktop-windows-latest.exe" '-o'"$srcdir/exe" '$PLUGINSDIR/app-64.7z'
  7z x "$srcdir/exe/\$PLUGINSDIR/app-64.7z" '-o'"$srcdir/app"

  asar extract "$srcdir/app/resources/app.asar" "$srcdir/app/resources/app"

  local main_js="$srcdir/app/resources/app/dist-electron/electron/main.js"
  sed -i \
    -e 's/const QK=!kt\.isPackaged,/const QK=!kt.isPackaged\&\&!Kv(mn.join(kt.getAppPath(),"dist-renderer\/index.html")),/' \
    -e 's/if(!kt\.isPackaged)return`\${An\.VITE_DEV_SERVER_URL}#\${YK}`/if(QK)return`${An.VITE_DEV_SERVER_URL}#${YK}`/' \
    -e 's/if(!kt\.isPackaged)return`\${An\.VITE_DEV_SERVER_URL}#\${n}`/if(QK)return`${An.VITE_DEV_SERVER_URL}#${n}`/' \
    "$main_js"

  grep -q 'const QK=!kt.isPackaged&&!Kv(mn.join(kt.getAppPath(),"dist-renderer/index.html"))' "$main_js"
}

package() {
  install -dm755 "$pkgdir/usr/lib/syncless"
  cp -r --no-preserve=ownership "$srcdir/app/resources/app" "$pkgdir/usr/lib/syncless/app"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/syncless" <<'EOF'
#!/bin/sh
exec electron41 /usr/lib/syncless/app "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/syncless"

  install -Dm644 "$srcdir/app/resources/app/assets/icons/app-icon.png" \
    "$pkgdir/usr/share/pixmaps/syncless.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/syncless.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Syncless
Comment=Syncless desktop client
Exec=syncless %U
Icon=syncless
Terminal=false
Categories=Utility;Network;
StartupWMClass=Syncless
EOF

  install -Dm644 "$srcdir/app/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$srcdir/app/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
