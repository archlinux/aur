# Maintainer: Lennard Kittner <lennard@kittner.dev>
_sourceName="hypr_steam_watcher"

pkgname="hypr_steam_watcher-git"
pkgver=1.1.0.r5.g94da806
pkgrel=1
pkgdesc="Automatically tags newly launched Steam games in Hyprland."
arch=('x86_64')
url="https://github.com/hyprland-community/hypr_steam_watcher"
license=('MIT')
depends=(
  glibc
  libgcc
)
makedepends=(
  git
  cargo
)
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')
provides=("hypr_steam_watcher")
conflicts=("hypr_steam_watcher" "hypr_steam_watcher-bin")

pkgver() {
  cd "${_sourceName}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_sourceName}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_sourceName}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release 
}

check() {
    cd "${_sourceName}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
  cd "${_sourceName}"
  find target/release \
      -maxdepth 1 \
      -executable \
      -type f \
      -exec install -Dm0755 -t "${pkgdir}/usr/bin/" {} +

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
