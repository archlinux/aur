# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=dev-prune
pkgver=1.22.0
pkgrel=1
pkgdesc="Find and reclaim disk space used by stale developer build artifacts and caches"
arch=('x86_64' 'aarch64')
url="https://github.com/Life-Experimentalist/dev-prune"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eec7cb5c20b384286848fa1a57da428e2e1eff04b82661143d3b784ddfe58645')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --bin dev-prune --bin devp
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/dev-prune "$pkgdir/usr/bin/dev-prune"
	install -Dm755 target/release/devp "$pkgdir/usr/bin/devp"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
