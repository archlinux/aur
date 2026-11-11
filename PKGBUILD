# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=panache
pkgver=3.18.0
pkgrel=1
pkgdesc='A language server, formatter, and linter for Pandoc, Quarto, and R Markdown'
arch=(x86_64 aarch64)
url="https://github.com/jolars/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc) # libc.so libm.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('a2f2ddc185cb127dc582026806775b661ce2dc6d4fc87f15628cb6de9344fc39')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	if check_option debug y; then
		export CARGO_PROFILE_RELEASE_DEBUG=2
		export CARGO_PROFILE_RELEASE_STRIP=false
	fi
	if check_option lto y; then
		export CARGO_PROFILE_RELEASE_LTO=thin
		export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	fi
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-fat'
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
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" target/man/*.1
	install -Dm0644 target/completions/panache.bash "$pkgdir/usr/share/bash-completion/completions/panache"
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" target/completions/panache.fish
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" target/completions/_panache
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
