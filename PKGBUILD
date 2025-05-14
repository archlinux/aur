# Maintainer: prime-run <prime-run@githiub.com>

pkgname=hyde-ipc

pkgver=0.1.2
pkgrel=1

pkgdesc="Control Hyprland, query its state, listen for events, and create automated reactions to events."

arch=("x86_64"  "aarch64")
license=('MIT')
url="https://github.com/HyDE-Project/hyde-ipc"

depends=(hyprland)
makedepends=("cargo" "git")

source=("git+$url.git")
sha256sums=(SKIP)

conflicts=('hyde-ipc-git')



pkgver() {
  cd "$pkgname"
  git describe --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname"
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/hyde-ipc" "$pkgdir/usr/bin/hyde-ipc"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
