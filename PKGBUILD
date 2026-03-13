# Maintainer: basicallygit <91993321+basicallygit@users.noreply.github.com>
# Issues with this package may be submitted to https://github.com/basicallygit/nacrypt/issues
pkgname=nacrypt
pkgver=1.2.7
pkgrel=1
pkgdesc="A simple & secure file encryption utility"
url="https://github.com/basicallygit/nacrypt"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=('libsodium')
makedepends=('rust' 'cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/basicallygit/nacrypt/archive/$pkgver.tar.gz")
sha256sums=("d9fc6866d27e7576d24f57e3a7d3fe1e6051f28e82801e4ad45900dd5e0846b3")
b2sums=("3f452a1c26c616baa2a0e34ca30597b92d7b31b519f2beeb4b685e970a956c20edb708bed25698e4f4299e317423a4676c3e22e39ba8f707280db1a6586ca3f6")

prepare() {
	export SODIUM_USE_PKG_CONFIG=1
	export SODIUM_SHARED=1
	
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export SODIUM_USE_PKG_CONFIG=1
	export SODIUM_SHARED=1
	
	cd "$pkgname-$pkgver"
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "target/release/$pkgname-inspect" "$pkgdir/usr/bin/$pkgname-inspect"
	install -Dm755 "target/release/$pkgname-overhead" "$pkgdir/usr/bin/$pkgname-overhead"
}
