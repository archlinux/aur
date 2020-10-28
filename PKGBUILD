# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=bb-rs
_pkgname=${pkgname/-rs}
pkgver=0.4.1
pkgrel=1
pkgdesc='Simple process viewer in Rust'
arch=(x86_64 aarch64)
url=https://nessuent.xyz/bb.html
license=(GPL3)
depends=(gcc-libs)
makedepends=(rust)
source=($pkgname-$pkgver.tar.gz::https://github.com/epilys/$_pkgname/archive/$pkgver.tar.gz)
sha512sums=('89c036a195801a3795768203c6af0e68d537002c57571720dd59f4afdc5a0b52faad734bc86674cb8c88e31c3a1e943c4d36321344ac8a78c6542020039e30a5')

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
