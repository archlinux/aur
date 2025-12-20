# Maintainer: Fritz Prix <fritzprix@gmail.com>
pkgname=libragent
pkgver=0.3.40
pkgrel=1
pkgdesc="A desktop app for AI agents with built-in tools"
arch=('x86_64')
url="https://github.com/fritzprix/libr-agent"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsecret')
makedepends=('git' 'cargo' 'nodejs' 'pnpm' 'clang')
source=("${pkgname}::git+https://github.com/fritzprix/libr-agent.git#tag=v${pkgver}"
        "libragent.desktop")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$pkgname"
  pnpm install --frozen-lockfile
}

build() {
  cd "$pkgname"
  # Ensure we don't try to sign the package
  export TAURI_SIGNING_PRIVATE_KEY=""
  export TAURI_SIGNING_KEY_PASSWORD=""
  
  # Fix for ring build issues in AUR environment
  # ring crate can fail with GCC or when CFLAGS interfere with assembly compilation
  export CC=clang
  export CXX=clang++
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  
  # Build the application using tauri build to ensure assets are bundled
  # --no-bundle skips creating deb/rpm/appimage which avoids linuxdeploy issues
  pnpm tauri build --no-bundle
}

package() {
  cd "$pkgname"
  
  # Install binary
  install -Dm755 "src-tauri/target/release/libragent" "$pkgdir/usr/bin/libragent"
  
  # Install icons
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/libragent.png"
  install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/libragent.png"
  install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/libragent.png"
  
  # Install desktop file
  install -Dm644 "../libragent.desktop" "$pkgdir/usr/share/applications/libragent.desktop"
  
  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
