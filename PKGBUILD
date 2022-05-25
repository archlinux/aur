# Maintainer: Amirul Fitri <tounghacker@gmail.com>

# maintainer's variables
_commit=a51e2b583f6d0249e4be0c97c96608d02e134798

pkgname=playit
pkgver=0.8.1+beta
pkgrel=1
pkgdesc="A tunneling tool to host a game server without port forwarding or sharing public IP"
arch=('x86_64')
url="https://playit.gg"
depends=('gcc-libs')
license=('BSD')
makedepends=('git' 'cargo')
source=("${pkgname}::git+https://github.com/playit-cloud/playit-agent.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
	cd "${pkgname}"
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

pkgver() {
	cd "${pkgname}"
	grep -Po "^version\s*=\s*\"\K.*(?=\")" packages/agent/Cargo.toml | sed 's/-/+/g'
}

build() {
	cd "${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "${pkgname}"
	install -Dm755 target/release/agent "${pkgdir}"/usr/bin/"${pkgname}"
	install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
