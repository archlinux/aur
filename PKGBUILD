# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ruben Kharel <aur-at-rubenk-dot-dev>

pkgname=talecast-git
pkgver=0.1.20.r124.gebe6e7f
pkgrel=1
pkgdesc="Simple CLI podcatcher"
arch=(x86_64)
url="https://github.com/TBS1996/TaleCast"
license=(MIT)
depends=('gcc-libs' 'openssl')
makedepends=("cargo" "git")
provides=("talecast")
conflicts=("talecast")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --all-features
}

# check() {
# 	export RUSTUP_TOOLCHAIN=stable
# 	cd "$pkgname"
# 	cargo test --frozen --all-features
# }

package() {
	cd "$pkgname"
	install -Dm755 target/release/talecast -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

