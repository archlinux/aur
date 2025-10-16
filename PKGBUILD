# Maintainer: Chip <itsjustchipoverhere@proton.me>

pkgname=rblx-silver-bin
pkgver=0.0.2
pkgrel=1
pkgdesc="A bootstrapper for Sober"
arch=('x86_64')
url="https://github.com/Wookhq/silverr"
license=('MIT')
depends=('libappindicator-gtk3' 'gtk3' 'libxss' 'nss' 'libx11' 'libxtst' 'libxrandr' 'alsa-lib')
makedepends=('npm' 'nodejs' 'debugedit' 'unzip')
tagversion="Alpha-0.0.2"


source=("https://codeload.github.com/Wookhq/silverr/zip/refs/tags/$tagversion"
        "silverr.desktop")
sha256sums=('955fc0a2ab88a1d11ff671fa540da67146e2e109b2b56e32cec3a6b76f5c18a2'
            'ad831dfbbbffc6c16532e306cb879c126de4a17c88832d2a327dc7138d0336f8')

prepare() {
  cd "$srcdir"
  unzip -o $tagversion
  mv silverr-$tagversion silverr
}

build() {
  cd "$srcdir/silverr"
  npm ci
  npm run build
  npm prune --production
}

package() {
  cd "$srcdir/silverr"
  npx electron-builder --linux --dir

  install -d "$pkgdir/opt/$pkgname"
  cp -r "dist/linux-unpacked/"* "$pkgdir/opt/$pkgname/"

  install -d "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
cd "/opt/${pkgname}"
./silverr "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/silverr.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/silverr/src/lib/assets/silverr.svg" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.svg"
}
