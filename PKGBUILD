# Maintainer: wintrx1155 <wintrx1155@proton.me>

pkgname=clara-verse
pkgver=0.1.3
pkgrel=2
pkgdesc="A privacy-first, client-side AI assistant WebUI for LLMs with ComfyUI integration"
arch=('x86_64')
url="https://github.com/badboysm890/ClaraVerse"
license=('MIT')
depends=('nodejs' 'npm' 'electron37' 'python' 'docker')
makedepends=('git' 'nodejs' 'npm')
optdepends=('ollama: For local LLM support')
provides=('clara-verse')
conflicts=('clara-verse')
source=("$pkgname-$pkgver.tar.gz::https://github.com/badboysm890/ClaraVerse/archive/refs/tags/v${pkgver}.tar.gz"
        "clara-verse.desktop"
        "clara-verse.install")
sha256sums=('5d5ec7c391a4fd5a9578ae1e9970c157d2b462d0b356e32a8caf29a09c47fca6'
            '61d260b4f6d79bf09311cd026ef4cdcba0c49b3857bc5bbeed30885d00423ad3'
            '87a7aa067aa8e61a013282c690eedfb2bd1900cea370395818cc37d159c34429')

prepare() {
  cd "ClaraVerse-$pkgver"
  
  # Add homepage field required by electron-builder
  sed -i '3i\  "homepage": "https://github.com/badboysm890/ClaraVerse",' package.json
  
  # Install dependencies
  npm ci
}

build() {
  cd "ClaraVerse-$pkgver"
  
  # Build the web application
  npm run build
  
  # Build the Electron application for Linux
  npm run electron:build-linux
}

package() {
  cd "ClaraVerse-$pkgver"
  
  # Create package directories
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/icons/hicolor"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  
  # Copy the built application
  cp -r release/linux-unpacked/* "$pkgdir/usr/lib/$pkgname/"
  
  # Create desktop entry
  install -Dm644 "$srcdir/clara-verse.desktop" "$pkgdir/usr/share/applications/"
  
  # Install icons
  for size in 16 24 32 48 64 128 256 512; do
    if [ -f "assets/icons/${size}x${size}.png" ]; then
      install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
      install -Dm644 "assets/icons/${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
    fi
  done
  
  # Create launcher script
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec /usr/lib/$pkgname/clara-verse "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  
  # Remove unnecessary files
  rm -rf "$pkgdir/usr/lib/$pkgname/locales"
  rm -rf "$pkgdir/usr/lib/$pkgname/resources/locales"
  
  # Fix permissions
  chmod +x "$pkgdir/usr/lib/$pkgname/clara-verse"
  chmod +x "$pkgdir/usr/lib/$pkgname/chrome-sandbox"
  chmod +x "$pkgdir/usr/lib/$pkgname/chrome_crashpad_handler"
}
