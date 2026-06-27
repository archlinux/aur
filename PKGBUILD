pkgname=rat-commander
pkgver=0.3.0
pkgrel=1
pkgdesc="A self-contained Norton/Midnight-Commander-style TUI file manager"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/dividebysandwich/rat-commander"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'xz')
makedepends=('cargo')
provides=('rc')
# Disable makepkg's LTO: the C `-sys` deps (aws-lc-sys, zstd-sys, unrar_sys) are
# otherwise compiled to LTO-bitcode static archives that lld cannot resolve at
# the final Rust link, causing "undefined symbol" errors (aws_lc_*, ZSTD_*).
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f2ac6590f2c3336bfa720e32db4d9b290be5a346fd8aa2a6da6878a2edd6eb17')

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
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
