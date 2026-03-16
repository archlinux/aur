# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=deadbranch
pkgver=0.3.0
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
sha256sums=('b773f176a26179c928f48c58c5299c6cc000f9e5d9ea71d258dcac3df19ef715')
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
