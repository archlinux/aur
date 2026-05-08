# Maintainer: arthurr0 <koeckiartur@gmail.com>
pkgname=mterminal-bin
_pkgname=mterminal
pkgver=0.8.0
pkgrel=1
pkgdesc="Custom terminal emulator with grouped tabs and warm dark UI (binary release)"
arch=('x86_64')
url="https://github.com/arthurr0/mTerminal"
license=('MIT')
depends=(
  'gtk3'
  'nss'
  'libnotify'
  'libxss'
  'libxtst'
  'alsa-lib'
)
provides=("$_pkgname")
conflicts=("$_pkgname" "mterminal-git")
options=('!strip' '!debug' '!lto')
source=(
  "$_pkgname-$pkgver.AppImage::https://github.com/arthurr0/mTerminal/releases/download/v$pkgver/mTerminal_${pkgver}_amd64.AppImage"
  "https://raw.githubusercontent.com/arthurr0/mTerminal/v$pkgver/packaging/$_pkgname.desktop"
  "https://raw.githubusercontent.com/arthurr0/mTerminal/v$pkgver/build/icon.png"
  "https://raw.githubusercontent.com/arthurr0/mTerminal/v$pkgver/LICENSE"
)
sha256sums=('dece035872f29064aa8578ac02f51dda6a6cd645d67cf92b3d944f8d964ebf28' '43c8d753ee939ec0077890ecb4bd359dde3609b0bb5b2b1183cb570836db6034' '25bb2bf785d51e6a4a075006b97d3742e5ce88b2b7933e871e1834df3785a4b5' '1699e3455f860d7875bb9791ec4f5926348722ca98bb834832a0bacddcbd12d6')

prepare() {
  cd "$srcdir"
  chmod +x "$_pkgname-$pkgver.AppImage"
  rm -rf squashfs-root
  # Extract without FUSE so the package contains plain files.
  "./$_pkgname-$pkgver.AppImage" --appimage-extract >/dev/null
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/opt/$_pkgname"
  cp -a squashfs-root/. "$pkgdir/opt/$_pkgname/"

  # Strip AppImage runtime cruft we don't need installed.
  rm -f "$pkgdir/opt/$_pkgname/AppRun" \
        "$pkgdir/opt/$_pkgname/.DirIcon" \
        "$pkgdir/opt/$_pkgname"/*.desktop \
        "$pkgdir/opt/$_pkgname"/*.png \
        "$pkgdir/opt/$_pkgname"/*.svg 2>/dev/null || true

  chmod -R u=rwX,go=rX "$pkgdir/opt/$_pkgname"
  chmod 0755 "$pkgdir/opt/$_pkgname/$_pkgname"

  # Chromium sandbox helper requires SUID root.
  if [[ -f "$pkgdir/opt/$_pkgname/chrome-sandbox" ]]; then
    chmod 4755 "$pkgdir/opt/$_pkgname/chrome-sandbox"
  fi

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$_pkgname" <<'EOF'
#!/bin/sh
exec /opt/mterminal/mterminal "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
