# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=kipr-git
pkgver=0.4.1.r0.ge191a1f
pkgrel=1
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
sha256sums=('SKIP')

pkgver() {
	cd "kipr-git"
	git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "kipr-git"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
