# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=carve-rs
pkgver=0.1.8
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
sha256sums=('c95361436076e6cdce83831f83bc0dcf56dab885242f532a0b24e6bfd4b0caf9')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
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

# Upstream excluded the tests folder from the Git archive export. Probably something the LLM told them to do however
# baseless. In any case we could switch to a Git clone as our source, but then we have to untangle the mess of
# submodules that cross check the implementation with other projects. Since we don't want to run those tests anyway
# and the submodule situation changes frequently I think it makes more sense to just stop running regression tests
# that don't do much for proving system package intergration anyway.
check() {
	return
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
