# Maintainer: Thomas Pellissier-Tanon <thomas at pellissier-tanon dot fr>

pkgname=oxigraph
pkgver=0.4.10
pkgrel=1
pkgdesc="SPARQL graph database and RDF toolkit"
arch=('x86_64')
url="https://github.com/oxigraph/oxigraph"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl' 'rocksdb')
makedepends=('pkg-config' 'rust')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/oxigraph/oxigraph/releases/download/v${pkgver//_/-}/oxigraph_v${pkgver//_/-}.tar.gz")
sha512sums=('360e71e6b34d953dfdd8401df2c636db09adbf48188d0a9ab4ca21c533e11f993aa2741313703c687630d5044c55274f871ad17908f5822ad9918b99d995f3f1')

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

check() {
    ./target/release/oxigraph --version
}

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
