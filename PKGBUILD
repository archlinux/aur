# Maintainer: Alexandros McCray <alexandros at amccray dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=runa
pkgver=0.12.2
pkgrel=1
pkgdesc="A fast and lightweight terminal file manager written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/alexm-dev/runa"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('88b1320961da52f9fdb1c51060e015c76a0bfb91714c59cb7fe93de67a3d5a5e')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/rn -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md docs/config/configuration.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 docs/config/config-reference/{display,editor,general,keys,theme}.md -t "$pkgdir/usr/share/doc/$pkgname/config-reference/"
}
