# Maintainer: Matthieu Monsch <mtth at apache dot org>

pkgname=netstate
pkgver=0.1.0
pkgrel=1
pkgdesc='Run hooks on network state change'
arch=(x86_64)
url=https://github.com/mtth/netstate
license=(MIT)

makedepends=(cargo)

source=(
	"$pkgname-v$pkgver.tar.gz::https://github.com/mtth/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
	'd926acc438361820a4ec437084a5dee938d534dabfeb699540d5783d4fcc76d3'
)

prepare() {
	mv "$pkgname-$pkgver"/* . # GitHub archives are nested
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export \
		RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target \
		NETSTATE_VERSION="$pkgver"
	cargo build --frozen --release --all-features
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
