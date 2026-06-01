# Maintainer: YourName <your-email@example.com>
pkgname=attack-shark-x11-electron
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross-platform driver for the Attack Shark X11 gaming mouse with Electron GUI"
arch=('x86_64')
url="https://github.com/dressedinblack5/attack-shark-x11-electron"
license=('MIT')
depends=('electron' 'libusb')
makedepends=('npm' 'typescript')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  npm install
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
  
  # Create a wrapper script to run the app
  install -d "$pkgdir/usr/bin"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/attack-shark-x11-driver"
  echo 'exec electron /usr/lib/attack-shark-x11-electron/main/index.js "$@"' >> "$pkgdir/usr/bin/attack-shark-x11-driver"
  chmod +x "$pkgdir/usr/bin/attack-shark-x11-driver"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install desktop entry
  install -Dm644 ../attack-shark-x11-driver.desktop "$pkgdir/usr/share/applications/attack-shark-x11-driver.desktop"
  
  # Install icon (assuming cs-mouse.svg is the icon)
  install -Dm644 assets/cs-mouse.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/attack-shark-x11.svg"
}
