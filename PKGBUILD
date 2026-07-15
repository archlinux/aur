# Maintainer: Mehmet Can <trwinner9@gmail.com>
pkgname=helium-sync
pkgver=0.4.0
pkgrel=1
pkgdesc="Zero-resource cloud synchronization daemon and DRM fixer for Helium Browser"
arch=('x86_64')
url="https://github.com/MehmetCanWT/Helium-Sync"
license=('MIT')
depends=('gcc-libs' 'glibc' 'python-pyqt6' 'python-pyqt6-webengine')
makedepends=('cargo' 'nodejs' 'npm')
source=("helium-sync-daemon::git+https://github.com/MehmetCanWT/Helium-Sync.git"
        "helium-sync.service"
        "helium-sync.desktop")
sha256sums=('SKIP'
            '9ecacceabb426d38ea4df1312cf6ca7607ca00ad112d61c1b36254939673fc2e'
            '953ea2b41fd9b29921ef8b5a02a75aff846d36009373b0ab4c7bbe3c06c89b60') # Actual checksum of local helium-sync.service

prepare() {
  cd "$srcdir/helium-sync-daemon/frontend"
  npm install
}

build() {
  # 1. Build frontend assets
  cd "$srcdir/helium-sync-daemon/frontend"
  npm run build

  # 2. Build embedded Rust binary
  cd "$srcdir/helium-sync-daemon"
  cargo build --release --locked
}

package() {
  cd "$srcdir/helium-sync-daemon"
  
  # Install executable daemon binary
  install -Dm755 "target/release/helium-sync-daemon" "$pkgdir/usr/bin/helium-sync-daemon"
  
  # Install Python GUI wrapper script
  install -Dm755 "helium-sync-gui" "$pkgdir/usr/bin/helium-sync-gui"
  
  # Install systemd user service
  install -Dm644 "$srcdir/helium-sync.service" "$pkgdir/usr/lib/systemd/user/helium-sync.service"

  # Install Desktop Launcher Entry
  install -Dm644 "$srcdir/helium-sync.desktop" "$pkgdir/usr/share/applications/helium-sync.desktop"

  # Install Application Icon
  install -Dm644 "frontend/src/assets/logo.png" "$pkgdir/usr/share/pixmaps/helium-sync.png"
}
