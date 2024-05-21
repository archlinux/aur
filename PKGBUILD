# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=conduwuit-git
pkgdesc="a very cool, featureful fork of Conduit matrix server"
url="https://github.com/girlbossceo/conduwuit"
license=("Apache-2.0")
arch=("any")
pkgver=0.3.4.3314.g9eb0784f
pkgrel=1
makedepends=("rust" "cargo" "git" "clang")
depends=("gcc-libs" "glibc" "liburing")
source=("git+https://github.com/girlbossceo/conduwuit")
sha512sums=('SKIP')
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

