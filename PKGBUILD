# Maintainer: Julien Virey <julien.virey+aur@gmail.com>
# Maintainer: Marko Ivankovic <marko@ivankovic.me>

pkgname=omnidiff
pkgver=0.4.0
pkgrel=1
pkgdesc="Fast, robust, accurate content-aware diffing"
arch=('x86_64' 'aarch64')
url="https://github.com/ivankovic/omnidiff"
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=(!lto !debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('864d75c5689691fc84df540a55f467ed2783cdb974ca9b627316143e4ab4ecf3')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --bin omnidiff
}

package() {
	cd "$pkgname-$pkgver"
	local bin="target/release/$pkgname"

	install -Dm0755 "$bin" "$pkgdir/usr/bin/$pkgname"

	"$bin" util man | install -Dm0644 /dev/stdin "$pkgdir/usr/share/man/man1/$pkgname.1"
	"$bin" util completions bash | install -Dm0644 /dev/stdin \
		"$pkgdir/usr/share/bash-completion/completions/$pkgname"
	"$bin" util completions zsh | install -Dm0644 /dev/stdin \
		"$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	"$bin" util completions fish | install -Dm0644 /dev/stdin \
		"$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
