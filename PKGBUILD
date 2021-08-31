# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tai-git
pkgver=0.0.5.r8.gcbfc87b
pkgrel=1
pkgdesc="terminal ascii image -- convert images to ascii art"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/MustafaSalih1993/tai"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=('tai')
conflicts=('tai')
source=("$pkgname::git+$url?signed")
md5sums=('SKIP')
validpgpkeys=(
	'3C7F4EC9D18C0D895DDE2BE240EFFE53BD9C22F3' ## Mustafa Salih
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' ## GitHub
)

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm 755 target/release/tai -t "$pkgdir/usr/bin/"
	install -Dm 444 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
