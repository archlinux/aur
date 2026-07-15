# Maintainer: Mehmet Can <trwinner9@gmail.com>
pkgname=helium-sync
pkgver=0.7.0
pkgrel=1
pkgdesc="Zero-resource cloud synchronization daemon and DRM fixer for Helium Browser"
arch=('x86_64')
url="https://github.com/MehmetCanWT/Helium-Sync"
license=('MIT')
depends=('gcc-libs' 'glibc' 'python-pyqt6' 'python-pyqt6-webengine')
makedepends=('cargo')
source=("helium-sync-daemon::git+https://github.com/MehmetCanWT/Helium-Sync.git"
        "helium-sync.service"
        "helium-sync.desktop"
        "helium-sync.png")
sha256sums=('SKIP'
            '9ecacceabb426d38ea4df1312cf6ca7607ca00ad112d61c1b36254939673fc2e'
            '953ea2b41fd9b29921ef8b5a02a75aff846d36009373b0ab4c7bbe3c06c89b60'
            '003901f94ba89055e7b4d0b11053cd2a4d3e1466d25ea67b1858a2716233d9cc')

build() {
  # Build embedded Rust binary (no nodejs/npm dependency anymore)
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
  install -Dm644 "$srcdir/helium-sync.png" "$pkgdir/usr/share/pixmaps/helium-sync.png"
}
