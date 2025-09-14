# Maintainer: wintrx1155 <wintrx1155@proton.me>

pkgname=clara-verse
pkgver=0.2.0
pkgrel=1
pkgdesc="A privacy-first, All in one AI workspace featuring LLMs, ComfyUI, n8n, and more"
arch=('x86_64')
url="https://github.com/badboysm890/ClaraVerse"
license=('MIT')
depends=('nodejs' 'npm' 'electron37' 'python' 'docker' 'libxcrypt-compat')
makedepends=('git' 'nodejs' 'npm' 'python-setuptools')
optdepends=('ollama: For local LLM support')
provides=('clara-verse')
conflicts=('clara-verse')
source=("$pkgname-$pkgver.tar.gz::https://github.com/badboysm890/ClaraVerse/archive/refs/tags/v${pkgver}.tar.gz"
        "clara-verse.desktop")
sha256sums=('6914fe79f0802670874a96b4541be04577a82e8dc400409f6151ae6dc8f86c58'
            '61d260b4f6d79bf09311cd026ef4cdcba0c49b3857bc5bbeed30885d00423ad3')

prepare() {
  cd "ClaraVerse-$pkgver"
  
  # Add homepage field required by electron-builder
  sed -i '3i\  "homepage": "https://github.com/badboysm890/ClaraVerse",' package.json
  
  # Install dependencies
  npm ci
  
  # Update node-abi to latest version
  npm install node-abi@latest
  
  # Set environment variables for native module compilation
  export npm_config_target=$(electron -v | sed 's/v//')
  export npm_config_arch=x64
  export npm_config_target_arch=x64
  export npm_config_disturl=https://electronjs.org/headers
  export npm_config_runtime=electron
  export npm_config_build_from_source=true
}

build() {
  cd "ClaraVerse-$pkgver"
  
  # Set environment variables for the build process
  export npm_config_target=$(electron -v | sed 's/v//')
  export npm_config_arch=x64
  export npm_config_target_arch=x64
  export npm_config_disturl=https://electronjs.org/headers
  export npm_config_runtime=electron
  export npm_config_build_from_source=true
  
  # Build the web application
  npm run build
  
  # Rebuild native modules
  npx electron-rebuild --version=$(electron -v | sed 's/v//')
  
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
