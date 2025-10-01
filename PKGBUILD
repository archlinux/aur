# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlen
pkgver=0.1.4
pkgrel=1
pkgdesc="Terminal User Interface LLM client for Ollama with chat and code assistance features"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlen"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://somegit.dev/Owlibou/owlen/archive/v${pkgver}.tar.gz")
sha256sums=('cabb1cfdfc247b5d008c6c5f94e13548bcefeba874aae9a9d45aa95ae1c085ec')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"

    # Install binaries
    install -Dm755 "target/release/owlen" "$pkgdir/usr/bin/owlen"
    install -Dm755 "target/release/owlen-code" "$pkgdir/usr/bin/owlen-code"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

