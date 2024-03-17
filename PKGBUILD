# Maintainer: Tyler Cook <aur@fossable.org>
pkgdesc='Immutable infrastructure for the desktop!'
pkgname='goldboot'
pkgver='0.0.2'
pkgrel='1'
url='https://github.com/fossable/goldboot'
arch=('x86_64')
license=('GNU Affero General Public License v3.0')
depends=('edk2-ovmf' 'qemu-base' 'qemu-ui-gtk')
makedepends=('cargo')
source=("goldboot-$pkgver.tar.gz::https://static.crates.io/crates/goldboot/goldboot-$pkgver.crate")
sha512sums=('SKIP')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --bin goldboot --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --bin goldboot --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
