# Maintainer: Caleb Maclennan <caleb@alerque.com>

_binname=sn
pkgname=tin-summer
pkgver=1.21.14
pkgrel=2
pkgdesc='Find build artifacts that are taking up disk space'
arch=(x86_64)
url="https://github.com/vmchale/$pkgname"
license=(BSD)
makedepends=(cargo)
conflicts=(mono)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8a4883b7a6354c6340e73a87d1009c0cc79bdfa135fe947317705dad9f0a6727')

prepare() {
	cd "$_archive"
	mkdir -p ./target/release/completions
	# Upstream Issue: https://github.com/vmchale/tin-summer/issues/35
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export BASH_COMPLETIONS_DIR="./target/release/completions"
	export FISH_COMPLETIONS_DIR="./target/release/completions"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --features bash,fish
	mv ./target/release/completions/$_binname{.bash,}
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --features bash,fish
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_binname"
	install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
	install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/" "target/release/completions/$_binname"
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" "target/release/completions/$_binname.fish"
}
