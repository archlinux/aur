# Maintainer: QaidVoid <contact@qaidvoid.dev>
pkgname=soar
pkgver=0.5.13
pkgrel=1
pkgdesc="A fast, modern package manager for Static Binaries, Portable Formats (AppImage|AppBundle|FlatImage|Runimage) & More"
arch=('aarch64' 'x86_64')
url="https://soar.qaidvoid.dev"
license=('MIT')
provides=('soar')
conflicts=('soar' 'soar-bin' 'soar-nightly-bin')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkgforge/soar/archive/v$pkgver.tar.gz")
sha256sums=('cfec1f9560a303f34f2a9f62eea7d7f0b52fbcc0fccd686a040c3925d994edf6')
# ring fails to build with lto
options=('!lto')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/soar -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 {README.md,CHANGELOG.md} -t "$pkgdir/usr/share/doc/$pkgname"
}
