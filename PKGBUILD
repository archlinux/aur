# Maintainer: Jaka Polesnik <polesnik.jaka@gmail.com>
pkgname=portage-manifest
pkgver=1.0.0
pkgrel=1
pkgdesc="A unified package browser for Arch Linux - search official repos, AUR, and Flatpak with beautiful README rendering"
arch=('x86_64')
url="https://github.com/Pol-Jak-295/portage-manifest"
license=('CC-BY-NC')
depends=('pacman' 'yay' 'flatpak')
makedepends=('npm' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pol-Jak-295/portage-manifest/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  npm run build  # or whatever your build script is (check package.json)
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install the built app (adjust path based on your electron-builder output)
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r dist/linux-unpacked/* "$pkgdir/usr/lib/$pkgname/"

  # Wrapper script so it runs via system electron
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec electron /usr/lib/$pkgname/resources/app.asar "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Desktop file
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Icon (uncomment if you have one)
install -Dm644 "$pkgname.svg" \
  "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
