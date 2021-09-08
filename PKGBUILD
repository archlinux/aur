# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>
pkgname=helium-ledger-cli
pkgdesc='Helium Application for Ledger'
license=('Apache')
url='https://github.com/helium/helium-ledger-cli'
pkgver=2.1.0
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
sha512sums=('08931f57360e2f0bd12a7f7f7d48bb8eedfb80753b41e2fc2e41369d2e9be2a6a11e2e4db88af3cd4bdb4ae191024852cfb7e84214e8b670d9c20a7b607fd61e')

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
