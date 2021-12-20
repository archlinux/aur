# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>
pkgname=helium-ledger-cli
pkgdesc='Helium Application for Ledger'
license=('Apache')
url='https://github.com/helium/helium-ledger-cli'
pkgver=2.1.3
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
sha512sums=('f715329263b3d7af169637e632a11073c357277c59d5374492907bc49dd59b6be48b4e40c2e37c08f86bf3c4dd2171753c1b8003f2d23c03d1822a4c000f7e57')

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
