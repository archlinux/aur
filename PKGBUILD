# Maintainer: Sosthène Guédon <dev@peertube-viewer.com>
pkgname=peertube-viewer-rs
pkgver=1.8.4
pkgrel=1
pkgdesc="Peertube command line viewer inspired by youtube-viewer"
arch=('any')
url="https://peertube-viewer.com" 
license=('MIT')
makedepends=(
  'rust'
)

depends=(
  'gcc-libs'
)
source=("https://gitlab.com/peertube-viewer/peertube-viewer-rs/-/archive/v$pkgver/peertube-viewer-rs-v$pkgver.tar.gz")
sha256sums=('a72ecdf09abd74c993498b0c8f1e25863bbc00f44b7b57ac1ae8a301472760f7')

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
    install -Dm755 completions/peertube-viewer-rs.bash $pkgdir/etc/bash_completion.d/peertube-viewer-rs.bash

    install -Dm755 peertube-viewer-rs.1 $pkgdir/usr/share/man/man1/peertube-viewer-rs.1
    gzip $pkgdir/usr/share/man/man1/peertube-viewer-rs.1

    install -Dm 755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
