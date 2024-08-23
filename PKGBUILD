# Maintainer: Thomas Pellissier-Tanon <thomas at pellissier-tanon dot fr>

pkgname=oxigraph
pkgver=0.4.0_alpha.8
pkgrel=2
pkgdesc="SPARQL graph database and RDF toolkit"
arch=('x86_64')
url="https://github.com/oxigraph/oxigraph"
license=('MIT' 'Apache-2.0')
depends=('openssl' 'rocksdb')
makedepends=('rust')
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/oxigraph/oxigraph/releases/download/v${pkgver//_/-}/oxigraph_v${pkgver//_/-}.tar.gz")
sha512sums=('25e83aa16870a6b0801674cef7e70f7246afeb6c64da7a9f68bfb1cdae1ac1c427ca549637e68e23e940ac4f87a276bcb027dd23b2c0bf107bb48b7b4df83138')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo"
    export CARGO_TARGET_DIR=target
    cargo build -p oxigraph-cli --frozen --release --features rocksdb-pkg-config
}

# FIXME: cargo test builds RocksDB
#check() {
#    export RUSTUP_TOOLCHAIN=stable
#    export CARGO_HOME="$srcdir/.cargo"
#    cargo test -p oxigraph-cli --frozen --features rocksdb-pkg-config
#}

package() {
    install -Dm755 "target/release/oxigraph" "$pkgdir/usr/bin/oxigraph"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
    find target/release/build/oxigraph-cli-*/out/complete/_oxigraph -exec install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions/" {} +
    find target/release/build/oxigraph-cli-*/out/complete/oxigraph.bash -exec install -Dm644 -t "$pkgdir/usr/share/bash-completion/completions/" {} +
    find target/release/build/oxigraph-cli-*/out/complete/oxigraph.fish -exec install -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" {} +
    mkdir -p "$pkgdir/usr/share/man/man1/"
    find target/release/build/oxigraph-cli-*/out/man/*.1 -exec install -Dm644 -t "$pkgdir/usr/share/man/man1/" {} +
}
