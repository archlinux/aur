# Maintainer: jackssrt <jack at jackssrt dot com>
pkgname="loago-git"
pkgver=1.0.0.r0.g4475233
pkgrel=1
epoch=
pkgdesc="Track how long ago you last did a task"
arch=("any")
url="https://github.com/Axlefublr/loago"
license=("MIT")
depends=()
makedepends=(git cargo)
checkdepends=()
optdepends=()
provides=("loago")
conflicts=("loago")

source=("$pkgname::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "$pkgname"
	# cutting off 'v' prefix that presents in the git tag
	git describe --long --abbrev=7 --dirty | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_HOME="$startdir/$srcdir/.cargo"
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_HOME="$startdir/$srcdir/.cargo"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/loago"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
