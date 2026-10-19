# Maintainer: asuka minato

pkgname=omofun
pkgver=2.0.2
pkgrel=1
pkgdesc='Desktop anime streaming client repackaged to run with system Electron'
arch=('x86_64')
url='https://omofun.tv/'
license=('LicenseRef-custom')
depends=('bash' 'electron40' 'gcc-libs' 'glibc')
makedepends=('asar' 'libarchive' 'patch')
# Download the installer manually and place it beside this PKGBUILD.
source=("file://omofun-${pkgver}-setup.exe"
        'download-selector.patch'
        'system-electron.patch')
noextract=("omofun-${pkgver}-setup.exe")
sha256sums=('d4472bcd965350d43b66e7df02fe142214d8e9f35e6ccf70f1d50306d76705eb'
            'b95804d2de3c5e9741c857ef83f4836e52d1a81524b12befb244f3b6966511fa'
            'ba59532862d78b90bde3a1ec74055b5ca27725e7290d321ded27c2bef56c9b26')

prepare() {
  rm -rf "$srcdir/exe" "$srcdir/app"
  mkdir -p "$srcdir/exe"

  bsdtar -xf "$srcdir/omofun-${pkgver}-setup.exe" -C "$srcdir/exe" \
    LICENSE.electron.txt \
    LICENSES.chromium.html \
    resources/app.asar \
    resources/app.asar.unpacked \
    resources/resources

  asar extract "$srcdir/exe/resources/app.asar" "$srcdir/app"
  cp -r --no-preserve=ownership "$srcdir/exe/resources/resources" "$srcdir/app/resources"
  patch --batch --forward --fuzz=0 "$srcdir/app/out/main/index.js" \
    "$srcdir/system-electron.patch"

  find "$srcdir/app/node_modules/koffi/build/koffi" \
    -mindepth 1 -maxdepth 1 -type d ! -name linux_x64 -exec rm -rf {} +
  rm -rf \
    "$srcdir/app/node_modules/@grpc/proto-loader/build/bin" \
    "$srcdir/app/node_modules/@septh" \
    "$srcdir/app/node_modules/electron-updater/node_modules/semver/bin" \
    "$srcdir/app/node_modules/js-yaml/bin" \
    "$srcdir/app/node_modules/koffi/doc" \
    "$srcdir/app/node_modules/koffi/src" \
    "$srcdir/app/node_modules/koffi/vendor" \
    "$srcdir/app/node_modules/libwin32" \
    "$srcdir/app/node_modules/qrcode/bin"

  local selectors=("$srcdir"/app/out/renderer/assets/DownloadSelectorView-*.js)
  if (( ${#selectors[@]} != 1 )) || [[ ! -f ${selectors[0]} ]]; then
    printf '%s\n' 'Expected one DownloadSelectorView JavaScript file.' >&2
    return 1
  fi
  patch --batch --forward --fuzz=0 "${selectors[0]}" "$srcdir/download-selector.patch"
}

package() {
  install -dm755 "$pkgdir/usr/lib/omofun"
  cp -r --no-preserve=ownership "$srcdir/app" "$pkgdir/usr/lib/omofun/app"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/omofun" <<'EOF'
#!/bin/sh
exec electron40 /usr/lib/omofun/app "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/omofun"

  install -Dm644 "$srcdir/app/resources/icon.png" \
    "$pkgdir/usr/share/pixmaps/omofun.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/omofun.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=OmoFun
Comment=OmoFun desktop client
Exec=omofun %U
Icon=omofun
Terminal=false
Categories=AudioVideo;Video;Player;
StartupWMClass=omofun
EOF

  install -Dm644 "$srcdir/exe/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$srcdir/exe/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
