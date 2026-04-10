# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=panache
pkgver=2.32.0
pkgrel=1
pkgdesc='A language server, formatter, and linter for Pandoc, Quarto, and R Markdown'
arch=(x86_64 aarch64)
url="https://github.com/jolars/$pkgname"
license=(MIT)
depends=(gcc-libs libgcc_s.so
         glibc) # libc.so libm.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('4b0b59cddacb5c787d0b963028f9cafdb2238d355b491365c55907716e6cce93')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	cargo test --frozen --release
}

package () {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" target/man/*.1
	install -Dm0644 target/completions/panache.bash "$pkgdir/usr/share/bash-completion/completions/panache"
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" target/completions/panache.fish
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" target/completions/_panache
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
