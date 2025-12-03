# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=cfspeedtest
pkgver=2.0.1
pkgrel=1
pkgdesc="Unofficial CLI for speed.cloudflare.com"
arch=('x86_64' 'aarch64')
url="https://github.com/code-inflation/cfspeedtest"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d4be9ee03851d4383544911a0d2e88d7835113fc3091a65ccf3f98ba5439da61')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
    	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -dm755 "$pkgdir/usr/share/bash-completion/completions" && \
		"$srcdir/$pkgname-$pkgver/target/release/$pkgname" --generate-completion bash > \
		"$pkgdir/usr/share/bash-completion/completions/cfspeedtest"
	install -dm755 "$pkgdir/usr/share/zsh/site-functions" && \
		"$srcdir/$pkgname-$pkgver/target/release/$pkgname" --generate-completion zsh > \
		"$pkgdir/usr/share/zsh/site-functions/_cfspeedtest"
	install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d" && \
		"$srcdir/$pkgname-$pkgver/target/release/$pkgname" --generate-completion fish > \
		"$pkgdir/usr/share/fish/vendor_completions.d/cfspeedtest.fish"
}
