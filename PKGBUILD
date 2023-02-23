# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=kipr-git
pkgver=0.3.0
pkgrel=2
pkgdesc='Command Line Password Manager'
url='https://github.com/grahamking/kipr'
license=('MIT')
arch=('any')
source=("$pkgname::git+https://github.com/grahamking/kipr")
makedepends=('cargo' 'git')
depends=("gnupg")
optdepends=('xclip: Clipoard functionality')
conflicts=('kipr')
provides=('kipr')
sha256sums=('7dce3d95d9bd1f7b3f99abc5afc15de2c46c4f81972c90c907d702bae50ffd25')

pkgver() {
	cd "kipr-git"
	git describe --long --abbrev=7 --tags | sed sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "kipr-git"
	case $CARCH in 
		"pentium4")
			cargo fetch --locked --target "i686-unknown-linux-gnu"
			;;
		*)
			cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
			;;
	esac
}

build() {
	cd "kipr-git"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "kipr-git"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "kipr-git"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/kipr"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/kipr/LICENSE"
}
