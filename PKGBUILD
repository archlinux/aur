# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=plox-git
pkgver=r24.98b05cd
pkgrel=1
pkgdesc="Extract numeric values from log files and plot them over time"
arch=('x86_64')
url="https://github.com/michalkucharczyk/plox"
license=('MIT OR Apache-2.0')
depends=()
makedepends=('cargo' 'git')
provides=('plox')
conflicts=('plox')
source=("plox::git+https://github.com/michalkucharczyk/plox.git")
sha256sums=('SKIP')

pkgver() {
	cd plox
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd plox
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd plox
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd plox
	install -Dm755 "target/release/plox" "$pkgdir/usr/bin/plox"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
