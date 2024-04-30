# Maintainer: Marcelo Hernandez <marcelohdez.inq at gmail dot com>
# PKGBUILD heavily inspired by swww's: https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=swww
pkgname=dim-screen
pkgver=0.2.2
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
)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('a9d0ff0487fe6fed3a40524af3914a57abd3aef69b2d9234d65557c1a7d8da37')

_archive="$pkgname-$pkgver"
_binname="dim"

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
	BINDIR='target/release'
	install -Dm755 "$BINDIR/$_binname" "$pkgdir/usr/bin/$_binname"

	# install completion files
	OUTDIR="$(ls -t "$BINDIR/build/" | grep "$pkgname" | head -1)"
	COMPDIR="$BINDIR/build/$OUTDIR/out"

	install -Dm644 "$COMPDIR/$_binname.bash" "$pkgdir/usr/share/bash-completion/completions/$_binname"
	install -Dm644 "$COMPDIR/_$_binname" "$pkgdir/usr/share/zsh/site-functions/_$_binname"
}
