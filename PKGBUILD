# Maintainer: Rayen Stark <Rayen.Stark@protonmail.com>
pkgname=powerctl
_pkgname=Powerctl
pkgver=0.1.0
pkgrel=1
pkgdesc="CPU/GPU power profile manager for Linux with Tauri GUI"
arch=('x86_64')
url="https://github.com/TheToxicSideOfMe/Powerctl"
license=('MIT')
depends=('power-profiles-daemon' 'webkit2gtk' 'gtk3')
optdepends=('supergfxctl: For GPU power management on supported systems')
makedepends=('rust' 'cargo' 'nodejs' 'pnpm')
install=powerctl.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6a8a8896f0fcc1fe3fc3963aaf9d9c3783c26216b1c054dd014af4d61c7b6484')

build() {
  cd "$_pkgname-$pkgver"
  
  pnpm install
  pnpm run build
  
  # Build the Tauri binary (bundling will fail but that's ok)
  pnpm tauri build 2>&1 | tee build.log || true
  
  # Verify the binary was actually built
  if [ ! -f "src-tauri/target/release/powerctl" ]; then
    echo "ERROR: Binary was not built!"
    cat build.log
    return 1
  fi
}

package() {
  cd "$_pkgname-$pkgver"
  
  # Install the Tauri binary
  install -Dm755 "src-tauri/target/release/powerctl" "$pkgdir/usr/bin/powerctl"
  
  # Install the installer script
  install -Dm755 "src-tauri/scripts/install-powerctl.sh" "$pkgdir/usr/local/bin/install-powerctl.sh"
  
  # Install desktop file
  install -Dm644 "powerctl.desktop" "$pkgdir/usr/share/applications/powerctl.desktop"
  
  # Install icon (if available)
  if [ -f "src-tauri/icons/128x128.png" ]; then
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/powerctl.png"
  fi
  
  # Install license (if it exists in the tarball)
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}