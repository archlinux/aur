# Maintainer: Mehmet Can <admin@cachyos.org>
pkgname=helium-sync
pkgver=0.3.0
pkgrel=1
pkgdesc="Zero-resource cloud synchronization daemon and DRM fixer for Helium Browser"
arch=('x86_64')
url="https://github.com/MehmetCanWT/Helium-Sync"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'nodejs' 'npm')
source=("helium-sync-daemon::git+https://github.com/MehmetCanWT/Helium-Sync.git"
        "helium-sync.service")
sha256sums=('SKIP'
            '9ecacceabb426d38ea4df1312cf6ca7607ca00ad112d61c1b36254939673fc2e') # Actual checksum of local helium-sync.service

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
  
  # Install executable binary
  install -Dm755 "target/release/helium-sync-daemon" "$pkgdir/usr/bin/helium-sync-daemon"
  
  # Install systemd user service
  install -Dm644 "$srcdir/helium-sync.service" "$pkgdir/usr/lib/systemd/user/helium-sync.service"
}
