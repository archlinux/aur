# Maintainer: Barışcan Aslan <i.aslan.bariscan@gmail.com>

pkgname=packager
pkgver=0.1.0
pkgrel=1
pkgdesc='Turn a local .deb or .rpm into a pacman package'
url='https://github.com/barscn/packager'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'gcc-libs' 'pkgfile' 'binutils' 'libarchive')
makedepends=('cargo')
# Cargo.toml already enables rustc LTO; GCC LTO breaks crates like ring.
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/barscn/packager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d81c1842d92d5d32bc66dec635bee09068bc87b89a7da43a622b0ff3565e80eb')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# Do not pass --all-features: `system` is opt-in integration tests.
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export RUST_TEST_THREADS=1
	cargo test --frozen --lib
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/packager "$pkgdir/usr/bin/packager"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
