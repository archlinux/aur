# Maintainer: mfw <espadonne@outlook.com>

pkgname=rcal
pkgver=0.3.1
pkgrel=1
pkgdesc='Responsive terminal calendar with local events and Microsoft Graph sync'
arch=('x86_64' 'aarch64')
url='https://github.com/tenseleyFlow/rcal'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'rust')
optdepends=(
    'dbus: for desktop notifications and Secret Service keyring integration'
    'systemd: for reminder daemon user service commands'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tenseleyFlow/rcal/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5abfdb8412ee8a7e794aa4e62d3d0dbd10931b0a0f2f3899a6cd91ab76d6ba20')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/rcal "$pkgdir/usr/bin/rcal"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
