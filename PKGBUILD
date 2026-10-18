# Maintainer: Omindu Gunathilaka <omindudulneth@outlook.com>

pkgname=pulse-tui
pkgver=0.2.0
pkgrel=1
pkgdesc="Production-grade terminal system monitor with animated TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/OminduD/pulse"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
    'nvidia-utils: GPU monitoring support via nvidia-smi'
    'openssh: remote host monitoring over SSH'
)
provides=('pulse-tui' 'pulse')
conflicts=('pulse')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OminduD/pulse/archive/refs/tags/v$pkgver.tar.gz")
# Run `updpkgsums` after tagging the release on GitHub to fill this in.
sha256sums=('6a5a4ee6768e4fb1342491a6ccef0d1521b651db30af34bd708e4b1716cd82cf')

prepare() {
    cd "pulse-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "pulse-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "pulse-$pkgver"
    cargo test --release --frozen
}

package() {
    cd "pulse-$pkgver"
    install -Dm755 target/release/pulse    "$pkgdir/usr/bin/pulse"
    ln -s pulse                            "$pkgdir/usr/bin/pulse-tui"
    install -Dm644 LICENSE                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md               "$pkgdir/usr/share/doc/$pkgname/README.md"
}
