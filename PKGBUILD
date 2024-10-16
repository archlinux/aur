# Maintainer: Thomas Pellissier-Tanon <thomas at pellissier-tanon dot fr>

pkgname=oxigraph
pkgver=0.4.1
pkgrel=1
pkgdesc="SPARQL graph database and RDF toolkit"
arch=('x86_64')
url="https://github.com/oxigraph/oxigraph"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl' 'rocksdb')
makedepends=('pkg-config' 'rust')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/oxigraph/oxigraph/releases/download/v${pkgver//_/-}/oxigraph_v${pkgver//_/-}.tar.gz")
sha512sums=('f7e60c359b88ad61f121b57f264cb8354e887bb3029178491e2add54a8b49f57db768a166b46f0a1fe7c8d4bb62efd3a381bae1aafdfa2355940a89d18391637')

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
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo"
    cargo test -p oxigraph-cli --frozen --features rocksdb-pkg-config
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
