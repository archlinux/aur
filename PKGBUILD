# Maintainer: Kimiblock Moe

pkgname=conduwuit
pkgdesc="a very cool, featureful fork of conduit"
url="https://github.com/girlbossceo/conduwuit"
license=("Apache-2.0")
arch=("x86_64")
pkgver=0.4.6
pkgrel=1
makedepends=("rust" "cargo" "git" "clang")
depends=("gcc-libs" "glibc" "liburing")
source=("git+https://github.com/girlbossceo/conduwuit#tag=v${pkgver}")
md5sums=('4fe26c4b143b6789a4615d8c67913da9')
provides=("conduwuit")
conflicts=()
options=(!lto)
backup=("etc/conduwuit/conduwuit.toml")
install=conduwuit.install

function prepare() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	export CONDUWUIT_VERSION_EXTRA=$(git rev-parse --short HEAD)
}

function build() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --locked
}

function check() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --release --frozen --locked --all-features
}

function package() {
	install -Dm755 "${srcdir}/conduwuit/target/release/conduit" "${pkgdir}/usr/bin/conduwuit"
	install -Dm644 "${srcdir}/conduwuit/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/conduwuit/conduwuit-example.toml" "${pkgdir}/etc/conduwuit/conduwuit.toml"
	install -Dm644 "${srcdir}/conduwuit/arch/conduwuit.service" "${pkgdir}/usr/lib/systemd/system/conduwuit.service"
}

