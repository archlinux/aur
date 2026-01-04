# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=seqtui-git
pkgver=0.1.0.r5.ga8d06be
pkgrel=1
pkgdesc='A fast terminal-based viewer and command-line toolkit for molecular sequences (DNA, AA)'
arch=(x86_64)
url='https://github.com/ranwez-search/SeqTUI'
license=(MIT)
depends=(gcc-libs glibc)
makedepends=(cargo git)
options=(!lto)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd SeqTUI
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd SeqTUI
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd SeqTUI
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    export CARGO_PROFILE_RELEASE_STRIP=none
    cargo build --frozen --release --all-features
}

check() {
    cd SeqTUI
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd SeqTUI
    install -Dm755 target/release/seqtui -t "$pkgdir/usr/bin"
    install -Dm644 examples/*.{nex,fasta} -t "$pkgdir/usr/share/doc/seqtui/examples"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
