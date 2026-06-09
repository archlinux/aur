# Maintainer: asuka minato

pkgname=omofun
pkgver=2.0.1
pkgrel=1
pkgdesc='Desktop anime streaming client repackaged to run with system Electron'
arch=('x86_64')
url='https://omofun.tv/'
license=('LicenseRef-custom')
depends=('bash' 'electron40' 'gcc-libs' 'glibc')
makedepends=('asar' 'libarchive')
source=("omofun-${pkgver}-setup1.exe::file://${startdir}/omofun-${pkgver}-setup1.exe")
noextract=("omofun-${pkgver}-setup1.exe")
sha256sums=('cf38f6e717831202df7e51ad1c3babfda2dfbc1f0af0533b955f4bb2862860de')

prepare() {
  rm -rf "$srcdir/exe" "$srcdir/app"
  mkdir -p "$srcdir/exe"

  bsdtar -xf "$srcdir/omofun-${pkgver}-setup1.exe" -C "$srcdir/exe" \
    LICENSE.electron.txt \
    LICENSES.chromium.html \
    resources/app.asar \
    resources/app.asar.unpacked \
    resources/resources

  asar extract "$srcdir/exe/resources/app.asar" "$srcdir/app"
  cp -r --no-preserve=ownership "$srcdir/exe/resources/resources" "$srcdir/app/resources"

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
    
  sed -i '67c\() => true' "$srcdir/app/out/renderer/assets/DownloadSelectorView-DdRFwVmm.js"
  
  sed -i '232c\      if (false) {' "$srcdir/app/out/renderer/assets/DownloadSelectorView-DdRFwVmm.js"
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
