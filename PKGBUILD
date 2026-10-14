# Maintainer: Mathieu Grenet <mathieu@mgth.fr>
#
# harlettizer — an open encoding engine for immersive audio: object masters to
# a lossless TrueHD/MLP stream carrying object metadata, or to IAMF in
# Matroska. Pure Rust, headless.
#
# Built with the `opus` feature, which links the system libopus (found by
# pkg-config), so `iamf --codec opus` works.

pkgname=harlettizer
pkgver=0.1.0
pkgrel=1
pkgdesc="Open encoding engine for immersive audio: object masters to TrueHD/MLP with object metadata, or IAMF"
arch=('x86_64')
url="https://github.com/harletty/harlettizer"
# The program is GPL-3.0-or-later; code ported into it keeps its own terms,
# whose notices are in LICENSES/ (Apache-2.0, BSD-3-Clause).
license=('GPL-3.0-or-later' 'Apache-2.0' 'BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'opus')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0cc373f71da6ee1875ff578c38287c4f0769d3c7a56367f4a6d7020cffc41db6')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    # Keep $srcdir out of the binary (panic-location paths).
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=src"
    cargo build --frozen --release -p hz-cli --features opus
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/harlettizer "$pkgdir/usr/bin/harlettizer"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
