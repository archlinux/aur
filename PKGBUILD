# Maintainer: flear <teymurzadehuseyn14@gmail.com>
pkgname=tuiba
pkgver=0.8.0
pkgrel=1
pkgdesc="Game Boy Advance emulator that runs in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/Huseynteymurzade28/tuiba"
license=('MIT')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'systemd-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14ab58210cc6a68072c82d2eba814d0a1c824dc545de6a68fc1575cef83da365')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p tuiba
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
