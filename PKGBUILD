# Maintainer: Eric Jingryd <tidynest@proton.me>

pkgname=hypr-keybind-manager
pkgver=1.2.1
pkgrel=1
pkgdesc='Secure keybinding manager for Hyprland with conflict detection'
arch=('x86_64' 'aarch64')
url='https://github.com/tidynest/hypr-keybind-manager'
license=('Apache-2.0')
depends=('gtk4' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
