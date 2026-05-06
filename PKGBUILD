# Maintainer: aero <sathwik4444@gmail.com>
pkgname=aero-sync-git
pkgver=1.1.0.r7.gd9f4532
pkgrel=1
pkgdesc="Zero-Wattage Sovereign RGB Screen Synchronization for ASUS TUF/ROG Laptops"
arch=('x86_64')
url="https://github.com/sathwik4444/aerosync"
license=('MIT')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugin-pipewire' 'asusctl')
makedepends=('cargo' 'git')
provides=('aero-sync')
conflicts=('aero-sync')
source=("${pkgname}::git+https://github.com/sathwik4444/aerosync.git#branch=main"
        "aero-sync.service")
md5sums=('SKIP'
         '1a36523651cb913315d8a43c6fc4c132')

pkgver() {
  cd "$pkgname"
  printf "1.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"
  # Binary
  install -Dm755 target/release/aero-sync "$pkgdir"/usr/bin/aero-sync
  
  # Service
  install -Dm644 "$srcdir"/aero-sync.service "$pkgdir"/usr/lib/systemd/user/aero-sync.service
  
  # Docs & License
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
