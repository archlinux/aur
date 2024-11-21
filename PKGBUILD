# Contributor: Jean Lucas <jean@4ray.co>
# Maintainer: tee < teeaur at duck dot com >

pkgname=bb-rs
_pkgname=${pkgname/-rs}
pkgver=0.4.4
pkgrel=1
pkgdesc='Simple process viewer in Rust'
arch=(x86_64 aarch64)
url='https://nessuent.xyz/bb.html'
license=(GPL3)
depends=(gcc-libs)
makedepends=(rust)
source=($pkgname-$pkgver.tar.gz::https://github.com/epilys/$_pkgname/archive/v$pkgver.tar.gz)
b2sums=('cc40490abef8badbfa613ae009f6fb1e44ddd6058baf72a4676271fe26665573f670a7ae9e617c0d2ea9b81c1dacb70bf65e97aadfeb9dc6f6f6cd522badda95')

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
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
