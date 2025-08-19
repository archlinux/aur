# Maintainer: Marcelo Hernandez <marcelohdez.inq at gmail dot com>
# Maintainer: Gabriel Garcia <gabrielgarciacs at proton dot me>
pkgname=dim-screen
pkgver=0.4.1
pkgrel=1
pkgdesc="Native Wayland screen dimming tool"
url="https://github.com/marcelohdez/dim"
arch=(x86_64 aarch64)
license=('GPL-3.0-only')
depends=(
	'gcc-libs'
	'glibc'
	'libxkbcommon'
)
makedepends=(
	'cargo'
	'scdoc'
	'gzip'
)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('6f10e12bbc0358cf20a43c1136f552ffe7081dc8023c8b131858f7fc87d709b7')

_archive="$pkgname-$pkgver"

prepare() {
	cd "$_archive"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_archive"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"

	# install binary
	install -Dm755 "target/release/dim" "$pkgdir/usr/bin/dim"
	
	# generate and install completions
	target/release/dim --gen-completions .
	
	mkdir -p "$pkgdir/usr/share/bash-completion/completions"
	install -Dm644 "dim.bash" "$pkgdir/usr/share/bash-completion/completions/dim.bash"

	mkdir -p "$pkgdir/usr/share/elvish/lib"
	install -Dm644 "dim.elv" "$pkgdir/usr/share/elvish/lib/dim.elv"

  	mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
	install -Dm644 "dim.fish" "$pkgdir/usr/share/fish/vendor_completions.d/dim.fish"

  	mkdir -p "$pkgdir/usr/share/zsh/site-functions"
	install -Dm644 "_dim" "$pkgdir/usr/share/zsh/site-functions/_dim"

	# generate and install man pages
	scdoc < "man/dim.1.scd" > "man/dim.1"
	gzip "man/dim.1"
	install -Dm644 "man/dim.1.gz" "$pkgdir/usr/share/man/man1/dim.1.gz"
}
