# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlen
pkgver=0.1.10
pkgrel=1
pkgdesc="Terminal User Interface LLM client for Ollama with chat and code assistance features"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlen"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
options=(!lto)  # avoid LTO-linked ring symbol drop with lld
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7cd68b67857f908e566e3c6578e2d5534c92969815a5a95282777b4c43467245')

prepare() {
    cd $pkgname
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname
    export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-Wl,--no-as-needed"
    export CARGO_PROFILE_RELEASE_LTO=false
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname
    export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-Wl,--no-as-needed"
    cargo test --frozen --all-features
}

package() {
    cd $pkgname

    # Install binaries
    install -Dm755 target/release/owlen "$pkgdir/usr/bin/owlen"
    install -Dm755 target/release/owlen-code "$pkgdir/usr/bin/owlen-code"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

