# Maintainer: Jan Buchar <jan@buchar.dev>
pkgname=dygma-uhid
pkgver=1
pkgrel=1
pkgdesc="Expose Dygma Raise 2 battery levels via UHID so they show up in UPower/Plasma"
arch=(x86_64 aarch64)
url="https://github.com/janbuchar/dygma-uhid"
license=(MIT)
depends=(gcc-libs glibc systemd-libs)
makedepends=(cargo clang)

source=("$pkgname-$pkgver.tar.gz::https://github.com/janbuchar/dygma-uhid/archive/refs/tags/release-1.tar.gz")
sha256sums=("2acb0c8a440d4082a0b13aa6d899794711899d34b5fd2bc16b54ae3368b3d8af")

prepare() {
	cd "$pkgname-release-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-release-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$pkgname-release-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 misc/dygma-uhid.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 misc/dygma-uhid.modules-load.conf "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
