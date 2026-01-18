# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=git-guitar-git
_pkgname=guitar
pkgver=0.1.39
pkgrel=1
pkgdesc='A terminal based git client with fast topological & chronological graph rendering - Built form the main bransh'
arch=(x86_64 aarch64)
url='https://github.com/asinglebit/guitar'
license=('GPL-3.0')
depends=(git)
makedepends=(cargo git)
provides=(${_pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # fix the naitive linking errors 
    export RUSTFLAGS="-Clinker-plugin-lto"
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/README.md" README.md
}

