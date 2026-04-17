# Maintainer: ry2x

pkgname=hyprcrop
pkgver=0.4.5
pkgrel=1
pkgdesc="A fast, Hyprland-native screenshot tool written in Rust"
arch=('x86_64')
url="https://github.com/ry2x/hyprcrop"
license=('MIT')
depends=('slurp' 'wl-clipboard' 'hyprland' 'libnotify' 'pipewire')
makedepends=('rust' 'cargo' 'clang' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9c3a5082f512fd0e2a20e8a5acbd2f0fc247ed84c9010277d644504c1b2c20c3')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # GCC LTO (-flto=auto) produces GCC IR objects incompatible with Rust's lld.
    # -ffat-lto-objects includes regular machine code alongside LTO IR so lld
    # can resolve symbols from C dependencies (e.g. libspa).
    export CFLAGS+=" -ffat-lto-objects"
    export CXXFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
