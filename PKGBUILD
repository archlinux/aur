# Maintainer: pakrohk <pakrohk@gmail.com>
pkgname=freellmapi-desktop-git
pkgver=0.4.1.r0.gabcdef
pkgrel=1
pkgdesc="FreeLLMAPI desktop app (Electron) — local OpenAI‑compatible LLM router"
arch=('x86_64' 'aarch64')
url="https://github.com/tashfeenahmed/freellmapi"
license=('MIT')
depends=('electron' 'nodejs' 'npm')
makedepends=('git' 'python' 'make' 'gcc' 'nss' 'gtk3' 'libxss' 'libxtst' 'xdg-utils')
source=("$pkgname::git+https://github.com/tashfeenahmed/freellmapi.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Generate version from the latest tag + commit count + hash
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  # Build the client dashboard (React/Vite)
  npm install
  npm run build

  # Enter the desktop directory
  cd desktop

  # Install Electron dependencies
  npm install

  # Stage client files for Electron
  npm run stage:client

  # Build the main Electron code
  npm run build:all

  # Build the AppImage for Linux (both x86_64 and ARM64)
  npx electron-builder --linux --x64 --arm64 --publish never
}

package() {
  cd "$srcdir/$pkgname/desktop"

  # Locate the generated AppImage
  appimage=$(find dist-electron -name "*.AppImage" | head -n1)

  if [[ -z "$appimage" ]]; then
    echo "Error: AppImage not found!"
    return 1
  fi

  # Install the AppImage into /usr/bin
  install -Dm755 "$appimage" "$pkgdir/usr/bin/freellmapi"

  # Create a .desktop file for the application menu
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/freellmapi.desktop" <<EOF
[Desktop Entry]
Name=FreeLLMAPI
Comment=Local OpenAI-compatible LLM router
Exec=freellmapi
Icon=freellmapi
Terminal=false
Type=Application
Categories=Development;Utility;
EOF

  # Install the icon if present
  if [[ -f "assets/appicon_1024.png" ]]; then
    install -Dm644 assets/appicon_1024.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/freellmapi.png"
  fi
}
