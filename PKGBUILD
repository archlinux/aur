# Maintainer: Luke Hsiao <luke@hsiao.dev>
pkgname=openring-rs
pkgver=0.5.7
pkgrel=1
pkgdesc='A tool for generating a webring from Atom/RSS feeds, written in Rust'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lukehsiao/openring-rs'
license=('BlueOak-1.0.0')
depends=('gcc-libs')
makedepends=('cargo')
provides=('openring')
conflicts=('openring')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lukehsiao/openring-rs/archive/v$pkgver.tar.gz")
sha256sums=('505c04e08a527deb6d11f3f453ff0aedff6be9ff5dbda3712ca3fa4a670d307e')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/openring "$pkgdir/usr/bin/openring"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}
