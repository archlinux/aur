# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=gpterm
pkgver=0.1.2
pkgrel=1
pkgdesc="Yet another command-line ChatGPT frontend written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/MakisChristou/gpterm"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ab992767c69ba7532979693ebcc12076d1d1648b715e53569d1adba07919a3a4')

prepare() {
	cd "rustgpt-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "rustgpt-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "rustgpt-$pkgver"
	install -Dm755 "target/release/rustgpt" "$pkgdir/usr/bin/rustgpt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
