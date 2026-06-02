# Maintainer: jackssrt <jack at jackssrt dot com>
pkgname="slim-osc-git"
pkgver=1.0.0.r0.gbac213a
pkgrel=1
epoch=
pkgdesc="incredibly thin program for displaying pc stats in a vrchat message."
arch=("x86_64")
url="https://github.com/jackssrt/slim-osc"
license=("MIT OR Apache-2.0")
depends=()
makedepends=(git cargo)
checkdepends=()
optdepends=()

source=("$pkgname::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "$pkgname"
	# cutting off 'v' prefix that presents in the git tag
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/slim-osc"
	install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
