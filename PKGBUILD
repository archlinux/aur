# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=seqtui
pkgver=0.1.1
pkgrel=1
pkgdesc='A fast terminal-based viewer and command-line toolkit for molecular sequences (DNA, AA)'
arch=(x86_64)
url='https://github.com/ranwez-search/SeqTUI'
license=(MIT)
depends=(gcc-libs glibc)
makedepends=(cargo)
options=(!lto)
source=("$url/archive/v$pkgver/SeqTUI-$pkgver.tar.gz")
b2sums=('84517c623d8a274d4c0c9794d4a81c1c8761dcbad4abf04b133c3b1fae6e49d84dd6d75e1f4be0483b6f50b72bf88417e24401bedad85b8c19ec23cf31411c44')

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
