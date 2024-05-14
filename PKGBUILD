# Maintainer: James Appleton <james.appleton01@gmail.com>
pkgname="flaq"
pkgdesc="A simple CLI tool for modifying and querying metadata tags for \`.flac\` files."
pkgrel=3
pkgver="0.4.0"

makedepends=("git" "cargo" "jq")
depends=("glibc" "gcc-libs")
url="https://github.com/jmsapt/flaq"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
arch=("any")
license=("MIT")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	# export RUSTUP_TOOLCHAIN=stable
	# cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	# install binary
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

	# install auto completion scripts
	install -Dm644 "target/scripts/$pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$pkgname.bash"
	install -Dm644 "target/scripts/$pkgname.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/$pkgname.fish"
	install -Dm644 "target/scripts/_$pkgname" "${pkgdir}/usr/share/zsh/site-functions/_$pkgname"

	install -d "$pkgdir/usr/share/"
}

# pkgver() {
# 	cd "${pkgname}"
# 	cargo metadata --format-version=1 --no-deps | jq ".packages[0].version"
# }
