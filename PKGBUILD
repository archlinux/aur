# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=panache
pkgver=3.0.0
pkgrel=2
pkgdesc='A language server, formatter, and linter for Pandoc, Quarto, and R Markdown'
arch=(x86_64 aarch64)
url="https://github.com/jolars/$pkgname"
license=(MIT)
depends=(gcc-libs libgcc_s.so
         glibc) # libc.so libm.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('6b61d93bd55f571b4f75db617987960703a5215d2c12898d78661cec3f7508f5')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -ffat-lto-objects'
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	local skipped=(
		lsp::test_cancellation::test_cancel_request_returns_request_cancelled
	)
	cargo test --frozen --release -- ${skipped[@]/#/--skip }
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
