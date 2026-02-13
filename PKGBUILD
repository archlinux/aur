# Maintainer: AnonMiraj ezzibrahimx@gmail.com
pkgname=tanin-git
pkgver=0.1.0.r0.gebafcac
pkgrel=1
pkgdesc="A TUI ambient sound generator written in Rust"
arch=('x86_64')
url="https://github.com/AnonMiraj/Tanin"
license=('MIT')
depends=('alsa-lib' 'openssl' 'gcc-libs' 'opus')
makedepends=('cargo' 'git')
optdepends=('yt-dlp: for downloading custom sounds from YouTube')
provides=('tanin')
source=("${pkgname}::git+https://github.com/AnonMiraj/Tanin.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
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

  # Install binary
  install -Dm755 "target/release/tanin" "$pkgdir/usr/bin/tanin"

  # Install assets to /usr/share/tanin/assets
  install -dm755 "$pkgdir/usr/share/tanin/assets"
  install -Dm644 assets/sounds.toml "$pkgdir/usr/share/tanin/assets/sounds.toml"

  # Recursive copy for sound files
  cp -r assets/sounds "$pkgdir/usr/share/tanin/assets/"

  # Set correct permissions for assets
  find "$pkgdir/usr/share/tanin/assets" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/tanin/assets" -type f -exec chmod 644 {} +

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
