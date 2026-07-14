# Maintainer: Mehmet Can <admin@cachyos.org>
pkgname=helium-sync
pkgver=0.2.0
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
            'adcb74967abb9fd79101310c557a0524b47a9e99dde793afc059775ed8e5249b') # Actual checksum of local helium-sync.service

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
