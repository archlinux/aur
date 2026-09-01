pkgname=rat-commander
pkgver=1.7.4
pkgrel=1
pkgdesc="A self-contained 2-panel terminal file manager with modern feartures like truecolor support and many built-in system tools."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/dividebysandwich/rat-commander"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'xz')
makedepends=('cargo')
provides=('rc' 'rcedit')
# Disable makepkg's LTO: the C `-sys` deps (aws-lc-sys, zstd-sys, unrar_sys) are
# otherwise compiled to LTO-bitcode static archives that lld cannot resolve at
# the final Rust link, causing "undefined symbol" errors (aws_lc_*, ZSTD_*).
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46a7149dafae86b13cf4a868235094d327ec87c0e711df0926fed9f815cae46a')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# --all-features keeps RAR support (the C++ `unrar` lib builds fine with a
	# current native toolchain; it is only dropped on the old arm cross images).
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	# The binary is installed as `rc` for quick typing.
	install -Dm0755 "target/release/rc" "$pkgdir/usr/bin/rc"
	# `rcedit` shim: `rcedit <file>` == `rc /edit <file>` (start in the editor).
	# `rc` recognises this name from argv[0], so a plain symlink is enough.
	ln -s rc "$pkgdir/usr/bin/rcedit"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
