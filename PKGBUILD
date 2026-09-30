# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=omnigraph
pkgver=0.11.0
pkgrel=1
pkgdesc="Graph database CLI built on the Lance columnar format"
arch=('x86_64' 'aarch64')
url="https://github.com/ModernRelay/omnigraph"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo' 'cmake' 'protobuf' 'pkgconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf1995aa2303096b04d8406cf5e318eb2b14d1aab79fa115f5feb7e9fa8fb248')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p omnigraph-cli
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/omnigraph "$pkgdir/usr/bin/omnigraph"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
