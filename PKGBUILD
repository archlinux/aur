# Maintainer: Barışcan Aslan <i.aslan.bariscan@gmail.com>

pkgname=packager
pkgver=0.2.0
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
sha256sums=('8fa38f794e051576df7633f1c43732986069e0ff1a3ba69fa0011bcc4493da1d')

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
