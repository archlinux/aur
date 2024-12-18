# Maintainer: Sosthène Guédon <dev@peertube-viewer.com>
pkgname=peertube-viewer-rs
pkgver=1.8.7
pkgrel=1
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('any')
url="https://peertube-viewer.com" 
license=('AGPL-3.0-or-later')
makedepends=(
  'rust'
)

depends=(
  'gcc-libs'
)
source=("https://gitlab.com/peertube-viewer/peertube-viewer-rs/-/archive/v$pkgver/peertube-viewer-rs-v$pkgver.tar.gz")
sha256sums=('66ecc04de35e41d4da8c6643bdfe594f9a6d4c7c443d9c898b009e8a9af1aa2e')

options=(!lto)

prepare() {
    cd $pkgname-v$pkgver
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname-v$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd $pkgname-v$pkgver
    install -Dm755 target/release/peertube-viewer-rs $pkgdir/usr/bin/peertube-viewer-rs
    install -Dm644 completions/peertube-viewer-rs.bash $pkgdir/usr/share/bash-completion/completions/peertube-viewer-rs

    install -Dm644 peertube-viewer-rs.1 $pkgdir/usr/share/man/man1/peertube-viewer-rs.1
    gzip $pkgdir/usr/share/man/man1/peertube-viewer-rs.1

    install -Dm644 COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
