# Maintaner: Sergey A. <murlakatamenka@disroot.org>

pkgname=aichat
pkgver=0.14.0
pkgrel=2
pkgdesc="OpenAI, ChatGPT, ollama and more in your terminal"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/sigoden/aichat"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo' 'clang' 'mold')
conflicts=('aichat-bin' 'aichat-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('de554ef95d75a17b20f384b5f2ea07b3d2cd6112e87e9e038145d13285633468')


prepare() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	# https://github.com/rui314/mold?tab=readme-ov-file#how-to-use
	export RUSTFLAGS="${RUSTFLAGS} \
      -C linker=clang \
      -C link-arg=-flto \
      -C linker-plugin-lto \
      -C link-arg=-fuse-ld=lld"

	cargo build --release --frozen
}

check() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable

	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"

	install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"

	install -Dm 644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
