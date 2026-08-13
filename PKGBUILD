# Maintainer: user14923929
pkgname=freedeb-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="AUR-like recipe manager for building and installing .deb packages"
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/freedeb-cli"
license=('GPL-3.0-only')
depends=('gcc-libs' 'bubblewrap' 'dpkg')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/user14923929/freedeb-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93356bf33f691d0a055e59d80daf050e9c27bb9cd661f61c8e87db5bfa6649ea')

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

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/freedeb" "$pkgdir/usr/bin/freedeb"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
