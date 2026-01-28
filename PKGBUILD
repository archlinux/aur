# Maintainer: Pater Kleomenis <paterkleomenis@gmail.com>
_pkgname=connected-desktop
pkgname=$_pkgname-git
pkgver=1.0.4
pkgrel=1
pkgdesc="High-speed, offline, cross-platform ecosystem bridging devices (Desktop Client)"
arch=('x86_64')
url="https://github.com/paterkleomenis/connected"
license=('MIT' 'Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'openssl' 'dbus')
makedepends=('cargo' 'git' 'pkgconf')
provides=("$_pkgname")
conflicts=("$_pkgname" "connected")
source=("git+$url.git"
        "connected-desktop.desktop")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "connected"
  # Generate a version based on git commit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "connected"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "connected"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --package "$_pkgname"
}

check() {
  cd "connected"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --package "$_pkgname"
}

package() {
  cd "connected"

  # Install binary
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Install licenses
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE-APACHE"

  # Install Desktop File
  install -Dm644 "$srcdir/connected-desktop.desktop" "$pkgdir/usr/share/applications/connected-desktop.desktop"

  # Install Icon
  install -Dm644 "android/app/src/main/ic_launcher-playstore.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/connected-desktop.png"
}