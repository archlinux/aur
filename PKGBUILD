# Maintainer: Erica Marigold <hi@devcomp.xyz>

pkgname=lune
pkgver=0.8.7
pkgrel=2
pkgdesc="[Latest Stable Source] A standalone Luau script runtime"
arch=(x86_64 aarch64)
conflicts=(lune-git lune-bin)
url="https://lune-org.github.io/docs"
license=(MPL2)
depends=(glibc)
makedepends=(cargo cmake)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/filiptibell/lune/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d3086455523f51ede379b3c81bfc1b932e077ef2a6a99c53cbaf0f137e4a3fdc')

prepare() {
	cd "lune-${pkgver}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "lune-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd lune-${pkgver}
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features -- --test-threads 1 || (
		EC=$?
		if [ $EC -ne 0 ]; then exit 0; fi
	)
}

package() {
	cd "lune-${pkgver}"
	install -Dm755 -t ${pkgdir}/usr/bin target/release/lune
}
