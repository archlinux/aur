# Maintainer: John Ettedgui <git@johne.rojalabs.com>
pkgname=pkgds
pkgver=0.1.2
pkgrel=1
pkgdesc="Real on-disk usage per installed Arch Linux package"
arch=('x86_64' 'aarch64')
url="https://github.com/John-Gee/pkgds"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
# `cargo` is provided by rust; `clang` (libclang) is needed by bindgen, a
# build-dependency of btrfs-uapi/btrfs-disk.
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/John-Gee/pkgds/archive/refs/tags/v$pkgver.tar.gz")
# TODO: replace SKIP with the real hash via `updpkgsums` once the v0.1.1 tag is
# pushed, then regenerate .SRCINFO.
sha256sums=('6df36e3670b0694fd8fc428f2694dd3d363b78ad5e581dead9b2e7dbe8ab5b20')

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	cargo build --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" man/pkgds.1
	install -Dm0644 completions/pkgds.bash "$pkgdir/usr/share/bash-completion/completions/pkgds"
	install -Dm0644 completions/_pkgds "$pkgdir/usr/share/zsh/site-functions/_pkgds"
	install -Dm0644 completions/pkgds.fish "$pkgdir/usr/share/fish/vendor_completions.d/pkgds.fish"
}
