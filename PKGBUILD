# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=carve-rs
pkgver=0.1.6
pkgrel=1
pkgdesc='Rust parser and HTML renderer for the Carve markup language'
arch=(x86_64)
url="https://github.com/markup-carve/$pkgname"
license=(MIT)
depends=(glibc # libc.so
         libgcc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/$pkgver/$_archive.tar.gz")
sha256sums=('a5159e50e0137e2b027c417fee44ce5146f28036a4c284167767a0d71739db6c')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -fno-fto'
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

prepare() {
	_srcenv
	# Upstream project neglected to trock the lock file at all, this package will *not*
	# be reproducible. See https://github.com/markup-carve/carve-rs/issues/1466
	cargo update
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	local skipped=(
		djot_migrate::escape_corpus::a_case_is_read
		djot_migrate::escape_corpus::escaping_only_ever_inserts_backslashes
		djot_migrate::escape_corpus::every_case_matches_under_every_profile
		djot_migrate::escape_corpus::the_handled_sets_match_the_corpus_profiles
		parse::layout::layout_html_tests::every_corpus_document_accepted_by_layout_has_exact_shadow_parity
	)
	cargo test --frozen --release -- ${skipped[@]/#/--skip }
}

package() {
	depends+=(libgcc_s.so)
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-rs}"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
