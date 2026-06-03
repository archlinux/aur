# Maintainer: YourName <your-email@example.com>
pkgname=attack-shark-x11-electron
pkgver=1.2.1
pkgrel=1
pkgdesc="Cross-platform driver for the Attack Shark X11 gaming mouse with Electron GUI"
arch=('x86_64')
url="https://github.com/dressedinblack5/attack-shark-x11-electron"
license=('MIT')
depends=('electron' 'libusb')
makedepends=('npm' 'typescript')
options=('!strip')
source=("-.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz" "attack-shark-x11-electron.desktop")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  npm install --legacy-peer-deps --ignore-scripts
}

build() {
  cd "$pkgname-$pkgver"
  npm run build
}

package() {
  cd "$pkgname-$pkgver"
  # Install the app files
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r out/* "$pkgdir/usr/lib/$pkgname/"

  # Install production dependencies
  install -d "$pkgdir/usr/lib/$pkgname"
  cp package.json "$pkgdir/usr/lib/$pkgname/"
  cd "$pkgdir/usr/lib/$pkgname"
  npm install --production --legacy-peer-deps --ignore-scripts

  # Create a wrapper script to run the app
  install -d "$pkgdir/usr/bin"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/attack-shark-x11-electron"
  echo 'exec electron /usr/lib/attack-shark-x11-electron/main/index.js "$@"' >> "$pkgdir/usr/bin/attack-shark-x11-electron"
  chmod +x "$pkgdir/usr/bin/attack-shark-x11-electron"

  # Install license
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install desktop entry
  install -Dm644 "$srcdir/attack-shark-x11-electron.desktop" "$pkgdir/usr/share/applications/attack-shark-x11-electron.desktop"

  # Install icon (assuming cs-mouse.svg is the icon)
  install -Dm644 "$srcdir/$pkgname-$pkgver/assets/cs-mouse.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/attack-shark-x11.svg"
}
