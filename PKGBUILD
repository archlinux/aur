# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

pkgname=grin
pkgver=5.2.0
pkgrel=1
pkgdesc='Minimal implementation of the MimbleWimble protocol'
arch=('any')
url='https://github.com/mimblewimble/grin'
license=('Apache-2.0')
depends=('ncurses')
makedepends=('clang' 'git' 'cargo')
backup=('etc/grin/server.toml')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        'grin-server.service'
        'grin-server.toml')
b2sums=('1a3b09274f07b0d95662b1388ac70b364173bf81bc55e1561fbb5848b81f3d1ad7f2524091428a5d73eb1e338f727ef9822e23e435ac17dc6e0de8d8e59d6839'
        '927c417ca92bf5dd024dc712b088789a7590555fde7b043ac1c39eec7c8a8ef28df3348cc49b49220c2dbfb5f01452f0757d4368172256d3b014445c612b21c1'
        '24a5cf856e9e316aa6bdb8a6156546b34e266689f088a3ecd0796975db027a016fdef916839df5f270d15ced47c324b87e6afa68a09ab87c396150974a153e07')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver

    install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/system" ../grin-server.service
    install -Dm0644 ../grin-server.toml "$pkgdir/etc/grin/server.toml"
}
