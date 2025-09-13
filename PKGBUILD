# Maintainer: Thomas Pellissier-Tanon <thomas at pellissier-tanon dot fr>

pkgname=oxigraph
pkgver=0.5.0
pkgrel=1
pkgdesc="SPARQL graph database and RDF toolkit"
arch=('aarch64' 'x86_64')
url="https://github.com/oxigraph/oxigraph"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc' 'openssl' 'rocksdb')
makedepends=('clang' 'pkg-config' 'rust')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/oxigraph/oxigraph/releases/download/v${pkgver//_/-}/oxigraph_v${pkgver//_/-}.tar.gz")
sha512sums=('966a2a7941cd4626131c515845119088672199480cd90e4c288bb5b84955bc0dca82a2f520d1d596e276123f3ae852351d11a986a7e9da99da5da970f2eeb781')

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
