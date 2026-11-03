# Maintainer: asuka minato

pkgname=omofun
pkgver=2.0.5
pkgrel=2
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
sha256sums=('7f9a5423c07a8449d697667c4155c66e0eeabf177e30e74cd7d2781e3d724c5d'
            '2183f9ecf3f0fa24bc9f119dcbc12a7d5bf4e981927e4d063485bf7b5bfc3306'
            '322f4af7a4cd086e785229426f29e3a3be76af132b040ac3be3497a035327194')

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
    "$srcdir/app/node_modules/qrcode/bin" \
    "$srcdir/app/node_modules/wasmoon/bin"

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
