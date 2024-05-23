# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=conduwuit-git
pkgdesc="a very cool, featureful fork of Conduit matrix server"
url="https://github.com/girlbossceo/conduwuit"
license=("Apache-2.0")
arch=("any")
pkgver=0.4.0.3327.geb8dd9cb
pkgrel=1
makedepends=("rust" "cargo" "git" "clang")
depends=("gcc-libs" "glibc" "liburing")
source=("git+https://github.com/girlbossceo/conduwuit"
		"conduwuit.service")
sha512sums=('SKIP'
            '563b2fbfb79a018737005a2ec5232afd85b70d463b05e889d092a45cb00038c4cf9f19c9a89a28838d9dc8d7e4178ebd2edf756e1e13c18e9a02b949f7e9c286')
provides=("conduwuit")
options=(!lto)
backup=("etc/conduwuit.toml")

pkgver() {
	cd conduwuit
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	export CONDUWUIT_VERSION_EXTRA=$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --locked
}

check() {
	cd "${srcdir}/conduwuit"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --release --frozen --locked --all-features
}

package() {
	install -Dm755 "${srcdir}/conduwuit/target/release/conduit" "${pkgdir}/usr/bin/conduwuit"
	install -Dm644 "${srcdir}/conduwuit/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/conduwuit/conduwuit-example.toml" "${pkgdir}/etc/conduwuit.toml"
	install -Dm644 "${srcdir}/conduwuit.service" "$pkgdir/usr/lib/systemd/system/conduwuit.service"
}

