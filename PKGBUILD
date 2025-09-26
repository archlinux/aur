# Maintainer: Chip <itsjustchipoverhere@proton.me>

pkgname=rblx-silver-git
pkgver=0.0.1.r
pkgrel=1
pkgdesc="A bootstrapper for Sober"
arch=('x86_64')
url="https://github.com/Wookhq/silverr"
license=('MIT')
depends=('libappindicator-gtk3' 'gtk3' 'libxss' 'nss' 'libx11' 'libxtst' 'libxrandr' 'alsa-lib')
makedepends=('npm' 'nodejs' 'git' 'debugedit')

source=("$pkgname::git+https://github.com/Wookhq/silverr.git#branch=main"
        "silverr.desktop")

sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir/$pkgname"

  npm ci
  npm run build
  npm prune --production
}

package() {
  cd "$srcdir/$pkgname"

  npx electron-builder --linux --dir

  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r "dist/linux-unpacked/"* "$pkgdir/opt/$pkgname/"

  # Create a wrapper script to launch the application
  install -d "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
cd "/opt/${pkgname}"
./silverr "$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/silverr.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname/src/lib/assets/silverr.svg" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.svg"
}
