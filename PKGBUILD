# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=squeeze
pkgver=0.3.0
pkgrel=1
pkgdesc="Extract rich information from any text (raw, JSON, HTML, YAML, etc.)"
arch=('x86_64' 'aarch64')
url="https://github.com/aymericbeaumet/squeeze"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5631f550c06369497b14abfb737c666ec99292fdd29bd1b75c41890e472c09f9')

prepare() {
	cd "squeeze-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "squeeze-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p squeeze-cli
}

package() {
	cd "squeeze-$pkgver"
	install -Dm755 "target/release/squeeze" "$pkgdir/usr/bin/squeeze"
	install -Dm644 readme.md "$pkgdir/usr/share/doc/$pkgname/readme.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
