# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=seqtui
pkgver=0.1.0
pkgrel=1
pkgdesc='A fast terminal-based viewer and command-line toolkit for molecular sequences (DNA, AA)'
arch=(x86_64)
url='https://github.com/ranwez-search/SeqTUI'
license=(MIT)
depends=(gcc-libs glibc)
makedepends=(cargo)
options=(!lto)
source=("$url/archive/v$pkgver/SeqTUI-$pkgver.tar.gz")
b2sums=('64922fb62caa12f4003a37c2a59b51c4f9c503b900d9e90e3edb7e679b7901349eaecfafa5078c9866a1c145d78f4dbb9cad748638926235080d20d7d4e3059e')

prepare() {
    cd SeqTUI-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd SeqTUI-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    export CARGO_PROFILE_RELEASE_STRIP=none
    cargo build --frozen --release --all-features
}

check() {
    cd SeqTUI-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd SeqTUI-$pkgver
    install -Dm755 target/release/seqtui -t "$pkgdir/usr/bin"
    install -Dm644 examples/*.{nex,fasta} -t "$pkgdir/usr/share/doc/seqtui/examples"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/seqtui"
}
