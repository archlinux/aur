# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>

pkgname=('panamax-git')
_gitname=('panamax')
pkgver=r188.f18494e
pkgrel=1
pkgdesc="Mirror rustup and crates.io repositories, for offline Rust and cargo usage"
url="https://github.com/panamax-rs/panamax"
license=('Apache' 'MIT')
source=('git+https://github.com/panamax-rs/panamax.git')
b2sums=('SKIP')
arch=('x86_64')
depends=('git')
makedepends=('cargo')
provides=('panamax')
conflicts=('panamax')

prepare() {
	cd "${_gitname}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_gitname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${_gitname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "${_gitname}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_gitname"
	install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
