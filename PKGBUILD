# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=deadbranch
pkgver=0.4.0
pkgrel=1
pkgdesc="Clean up stale git branches safely."
arch=('x86_64')
url="https://github.com/armgabrielyan/deadbranch"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=(cargo)
checkdepends=(git)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6a4b45018f3daae0302469d6a305a7c143bc207284210310ca5532c2ee6536f3')
options=('!lto' '!debug')

prepare() {
	cd "$pkgname-$pkgver"

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_PROFILE_RELEASE_LTO=false

	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
