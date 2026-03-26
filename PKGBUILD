# Maintainer: Josh Holmer <jholmer.in@gmail.com>

pkgname=octocode
pkgver=0.12.2
pkgrel=1
pkgdesc='Semantic code indexer and MCP utility for codebases'
arch=('x86_64')
url='https://github.com/Muvon/octocode'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'protobuf')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('7de078030a6e23e5d9b33ae1d666095b319fd0b9a830139155e07102d99812f1')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --frozen --release --no-default-features
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --frozen --no-default-features
}

package() {
	cd "$pkgname-$pkgver"

	local _bin="target/release/$pkgname"
	install -Dm755 "$_bin" "$pkgdir/usr/bin/$pkgname"

	install -dm755 "$pkgdir/usr/share/bash-completion/completions"
	"$_bin" completion bash >"$pkgdir/usr/share/bash-completion/completions/$pkgname"

	install -dm755 "$pkgdir/usr/share/zsh/site-functions"
	"$_bin" completion zsh >"$pkgdir/usr/share/zsh/site-functions/_$pkgname"

	install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
	"$_bin" completion fish >"$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
