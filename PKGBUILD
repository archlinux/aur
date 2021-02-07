# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=bb-rs
_pkgname=${pkgname/-rs}
pkgver=0.4.3
pkgrel=1
pkgdesc='Simple process viewer in Rust'
arch=(x86_64 aarch64)
url=https://nessuent.xyz/bb.html
license=(GPL3)
depends=(gcc-libs)
makedepends=(rust)
source=($pkgname-$pkgver.tar.gz::https://github.com/epilys/$_pkgname/archive/$pkgver.tar.gz)
sha512sums=('62567c74b54a197ae7a65ec7313a539b03f723364a931207a6cd86f172075a2e6f7655fdae21f9997f96fa08d2f4150830ac82f6a0ad08c41fd86a4cf9c4fbd7')

prepare() {
	if [[ $CARCH = aarch64 ]]; then
		# Fixes build on AArch64
		sed 's#i8#u8#g' -i $_pkgname-$pkgver/src/ui.rs
	else true # Fixes build in chroot on x86_64
	fi
}

build() {
	cd $_pkgname-$pkgver
	cargo build --release
}

check() {
	cd $_pkgname-$pkgver
	cargo test --release
}

package() {
	cd $_pkgname-$pkgver
	install -D target/release/$_pkgname -t "$pkgdir"/usr/bin
	install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
