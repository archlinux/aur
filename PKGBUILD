# Maintainer: prime-run <prime-run@githiub.com>

pkgname=hyde-ipc-git
_pkgname=hyde-ipc
pkgver=0.1.2
pkgrel=1
pkgdesc="Control Hyprland, query its state, listen for events, and create automated reactions to events."
arch=("x86_64")
license=('MIT')
url="https://github.com/HyDE-Project/hyde-ipc"
depends=(hyprland)
makedepends=(
  cmake
  git
  rust
)
source=("git+$url.git")
sha256sums=(SKIP)

prepare() {
  cargo fetch \
    --locked \
    --target "$(rustc -vV | sed -n 's/host: //p')" \
    --manifest-path hyde-ipc/Cargo.toml
}

build() {
  export CARGO_TARGET_DIR=target
  CFLAGS+=" -ffat-lto-objects"
  cargo build \
    --release \
    --frozen \
    --manifest-path hyde-ipc/Cargo.toml
}

package() {
  install -Dm755 "./target/release/hyde-ipc" "$pkgdir/usr/bin/$_pkgname"
}
post_install() {
  hyde-ipc --help
}
