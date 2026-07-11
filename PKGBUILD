# Maintainer: gilcu3
# Previous Maintainer: Nina <nina@l1f.de>
# Contributor: Nina <nina@l1f.de>
pkgname=viddy
pkgver=1.3.1
pkgrel=1
pkgdesc="A modern watch command"
arch=('x86_64' 'aarch64')
url="https://github.com/sachaos/viddy"
license=('MIT')
makedepends=(cargo)
options=(!debug !lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sachaos/viddy/archive/v${pkgver}.tar.gz")
sha256sums=('c5de99390846029aacb23789ce20267142dc89f647c519a0a0bb4821334cc6e5')

prepare() {
	cd ${pkgname}-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
	cd ${pkgname}-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

check() {
	cd ${pkgname}-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}
