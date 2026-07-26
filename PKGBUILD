# Maintainer: J. S. Brown <jsbrown7@gmail.com>
pkgname=based
pkgver=0.1.0
pkgrel=1
pkgdesc="GUI for viewing and editing Base16/Base24 color scheme YAML files"
arch=('x86_64')
url="https://github.com/OldJobobo/based"
license=('MIT')
depends=('gcc-libs' 'glibc' 'gtk3' 'libxkbcommon' 'wayland')
makedepends=('rust' 'cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1fefa69026f37be2b901dc32ea2f107166651dcfc692e6a1832037bde0c2d6c3')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/$pkgname"
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/based"             "$pkgdir/usr/bin/based"
    install -Dm644 "assets/app-logo.png"              "$pkgdir/usr/share/pixmaps/based.png"
    install -Dm644 "packaging/based.desktop"          "$pkgdir/usr/share/applications/based.desktop"
    install -Dm644 LICENSE                             "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
