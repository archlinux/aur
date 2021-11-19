# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>
pkgname=helium-ledger-cli
pkgdesc='Helium Application for Ledger'
license=('Apache')
url='https://github.com/helium/helium-ledger-cli'
pkgver=2.1.2
pkgrel=1
arch=('x86_64')
makedepends=(
    'rust'
    'cargo'
    'systemd'
    'cmake'
    'clang'
)
source=("https://github.com/helium/helium-ledger-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('23db5212800596616b65c4c9245ccf03cc5d28d5957e2e4068753cbb97cab8ab5ec60a0c8fb08bc199007749e5fa094169a080288e830c39088927dd6cf012ef')

build() {
    cd ${pkgname}-${pkgver}
    # Update only helium-crypto for v2.1.0 as it breaks on p256 dependency otherwise
    RUSTUP_TOOLCHAIN=stable cargo update -p helium-crypto
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd ${pkgname}-${pkgver}
    RUSTUP_TOOLCHAIN=stable cargo test --locked --target-dir=target
}

package() {
    cd ${pkgname}-${pkgver}
	install -Dt "$pkgdir/usr/bin/" target/release/helium-ledger-cli
}
