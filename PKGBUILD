# Maintainer: QaidVoid <contact@qaidvoid.dev>
pkgname=soar
pkgver=0.5.4
pkgrel=0
pkgdesc="A fast, modern package manager for Static Binaries, Portable Formats (AppImage|AppBundle|FlatImage|Runimage) & More"
arch=('aarch64' 'x86_64')
url="https://soar.qaidvoid.dev"
license=('MIT')
provides=('soar')
conflicts=('soar' 'soar-bin' 'soar-nightly-bin')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkgforge/soar/archive/v$pkgver.tar.gz")
sha256sums=('8a5a9d04928bc43ba10d85626487e67bbb93590723b5c1cb4187e777e276b39e')
# ring fails to build with lto
options=('!lto')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/soar -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 {README.md,CHANGELOG.md} -t "$pkgdir/usr/share/doc/$pkgname"
}
