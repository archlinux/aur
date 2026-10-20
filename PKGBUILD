# Maintainer: flear <teymurzadehuseyn14@gmail.com>
pkgname=tuiba
pkgver=0.15.2
pkgrel=1
pkgdesc="Game Boy Advance emulator that runs in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/Huseynteymurzade28/tuiba"
license=('MIT')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'systemd-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b178315ea522de96071c4679bcc238351f033396361d3912c3d00a82b4a7f84b')

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
