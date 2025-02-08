# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=wrestic
pkgver=1.7.2
pkgrel=1
pkgdesc='A wrapper around restic built in rust'
arch=('x86_64')
url="https://github.com/alvaro17f/$pkgname"
license=('LGPL-3.0-only')
provides=('wrestic')
conflicts=('wrestic')
depends=("glibc" "gcc-libs")
makedepends=('cargo')
source=(
	"$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz"
	"wrestic-1.6.1-no-self-update.patch"
)
sha256sums=('3c70e2592c4b18a8eae24018ee77f1538552348ab4d846b79195472cce21765c'
            '863c234130b9eece450fe4529909999ba5ee4cb0dbed776b1830784ae7599a39')

prepare() {
	patch -Np1 -d "$pkgname-$pkgver" -i ../wrestic-1.6.1-no-self-update.patch

	cd "$srcdir/$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --features no-self-update

	# completions
	cd target/release
	for shell in bash zsh fish; do
		./$pkgname completions "$shell" >"$shell-completion"
	done
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/wrestic/README.md"
	install -Dm644 wrestic.toml "$pkgdir/usr/share/doc/wrestic/wrestic.toml"

	# completions
	cd target/release
	install -Dm644 bash-completion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 zsh-completion "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 fish-completion "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
