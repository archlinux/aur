# Maintainer: Fermín Olaiz <fermin@olaiz.net>

pkgname=nushell-plugin-hcl
pkgver=0.115.0
pkgrel=1
pkgdesc="A nushell plugin for parsing Hashicorp Configuration Language file format"
arch=('x86_64' 'aarch64')
url='https://crates.io/crates/nu_plugin_hcl'
license=('MIT')
depends=('glibc' 'nushell')
makedepends=('cargo')
install=nushell-plugin-hcl.install
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/nu_plugin_hcl/nu_plugin_hcl-$pkgver.crate"
        "https://raw.githubusercontent.com/Yethal/nu_plugin_hcl/refs/heads/main/LICENSE")
sha256sums=('4e79abc54fe44cd08e0d0a44f85c80301b8742cb8e44b52452e0ee5ab18aca79'
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
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" 'LICENSE'
}
