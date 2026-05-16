# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=nushell-plugin-hcl
pkgver=0.112.2
pkgrel=2
pkgdesc="A nushell plugin for parsing Hashicorp Configuration Language file format"
arch=('x86_64' 'aarch64')
url='https://crates.io/crates/nu_plugin_hcl'
license=('MIT')
depends=('glibc' 'nushell')
makedepends=('cargo')
install=nushell-plugin-hcl.install
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/nu_plugin_hcl/nu_plugin_hcl-$pkgver.crate"
        "https://raw.githubusercontent.com/Yethal/nu_plugin_hcl/refs/heads/main/LICENSE")
sha256sums=('91dfe628cc34d47f96de263d156c896c8d3f47a8135fefcb75901aa3839c2718'
            '3f9622d715adf3762d9448c869727ac3d3ed50cad29bbe6e411b7864205d8581')

prepare() {
	cd "nu_plugin_hcl-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "nu_plugin_hcl-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "nu_plugin_hcl-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
	cd "nu_plugin_hcl-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" 'target/release/nu_plugin_hcl'
	install -Dm644 -t "$pkgdir/usr/share/licenses/nushell-plugin-hcl/" 'LICENSE'
}
