# Maintainer: coffebar i8ehkvien@mozmail.com
# shellcheck disable=SC2034,SC2154

pkgname=waybar-module-pacman-updates-git
pkgver=0.2.9
pkgrel=1
pkgdesc='Waybar module for Arch to show system updates available'
arch=('x86_64')
url="https://github.com/coffebar/waybar-module-pacman-updates"
license=('GPL-3.0-or-later')
options=(!lto)
makedepends=(cargo git pacman)
depends=(waybar pacman pacman-contrib curl openssl)
source=("git+$url#commit=79f9606")
sha256sums=('SKIP')

pkgver(){
  cd "waybar-module-pacman-updates" || return 1
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
    cd "waybar-module-pacman-updates" || return 1
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "waybar-module-pacman-updates" || return 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "waybar-module-pacman-updates" || return 1
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/waybar-module-pacman-updates"
}
