# Maintainer: usoy <alfortearjay0@gmail.com>
pkgname=veneer
pkgver=0.1.1
pkgrel=1
pkgdesc="A widget manager for Eww (Veneer)"
arch=('x86_64')
url="https://github.com/usoy410/Veneer"
license=('MIT')

depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl' 'zstd')
makedepends=('cargo' 'npm' 'git' 'zstd' 'openssl' 'pkgconf')

# Pinned to the specific version tag to ensure stable, reproducible builds
source=("veneer::git+https://github.com/usoy410/Veneer.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/veneer"

  # 1. Ensure the Node dependencies are fresh
  npm install

  # 2. FORCE the zstd-sys crate to build from source instead of linking
  # to the incompatible Arch system library.
  export ZSTD_SYS_USE_PKG_CONFIG=0

  # 3. Build the binary (no-bundle since we are packaging manually in package())
  npm run tauri build -- --no-bundle
}

package() {
  cd "$srcdir/veneer"

  # Binary
  install -Dm755 "src-tauri/target/release/veneer" "$pkgdir/usr/bin/veneer"

  # Desktop Entry
  if [ -f "veneer.desktop" ]; then
    install -Dm644 "veneer.desktop" "$pkgdir/usr/share/applications/veneer.desktop"
  fi

  # Icons
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/veneer.png"
  install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/veneer.png"
  install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/veneer.png"

  # License (Required by Arch guidelines for MIT)
  # Assuming your license file is named LICENSE or LICENSE.md in the root of your repo
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}