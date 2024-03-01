pkgname=hunt
pkgver=2.1.0
pkgrel=1
pkgdesc='Highly-opinionated simplified Find command made with Rust'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/LyonSyonII/hunt-rs'
license=('MIT')
makedepends=('cargo')
source=(
	"$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
	'build.rs')
sha512sums=(
	'371380befefcc699fd72af51f77dbb0a78c0fe7654fcedbde5fc4194e525b60b3dbc94b455d03bb09f8348389c1fbb11dd55459b3f6f029afc4b0738a55fce14'
	'6fb1580ce22aa2bd29c008437d38b86f029fbd39ec99d9c355e6941591fd65f8a21be048d6af802e7a4c73ade1ae95a28a8a99e73372fef4e62ef2bb3eb76b5c')
b2sums=(
	'26d2c105d2c776abe07b145f9b4d29b5f55d971610da68f02f1c1a15157e89945a909d26335266606348de87af3c86b8b73bae3c529ccc895534c841c9f93033'
	'a13500efda184e23da37305cf99b40b2a05aa589e6b625e1580e70f8c5a0c112641d10ba45a9f90d15aa8c8fec63446275ca65572bace1c0e2df4fdd59f226fd'
)

prepare() {
	cd "$pkgname-$pkgver"
	# Workaround lint errors by defining additional libraries with build.rs
	install -Dm0644 ../build.rs ./build.rs
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}


#check() {
#	cd "$pkgname-$pkgver"
#	export RUSTUP_TOOLCHAIN=stable
#	cargo test --frozen --all-features
#}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
