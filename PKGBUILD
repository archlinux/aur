# Maintainer: Chip <itsjustchipoverhere@proton.me>

pkgname=silverr
pkgver=0.0.1.r
pkgrel=1
pkgdesc="A bootstrapper for Sober"
arch=('x86_64')
url="https://github.com/Wookhq/silverr"
license=('MIT')
depends=('electron')
makedepends=('npm' 'nodejs' 'git')

source=("git+https://github.com/Wookhq/silverr.git#branch=main"
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

  install -Dm755 "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/silverr.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 "$srcdir/$pkgname/src/lib/assets/silverr.svg" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.svg"
}
