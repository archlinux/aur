# Maintainer: Kristofers Solo <aur at kristofers dot xyz>
pkgname=mekle
pkgver=0.2.0
pkgrel=1
pkgdesc='Fast project discovery tool for developers'
arch=('x86_64' 'aarch64')
url='https://github.com/kristoferssolo/mekle'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
conflicts=('mekle-bin' 'mekle-git')
install=mekle.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('77f360e110c2d9ffe0de1fd6799b4a88eed7de248bd73615d02f46797179a128')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin mekle
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/mekle "$pkgdir/usr/bin/mekle"
    install -Dm644 config/config.toml "$pkgdir/usr/share/mekle/config.toml"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
