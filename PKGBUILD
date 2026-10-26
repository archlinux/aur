# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=comrak
pkgver=0.59.0
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=(x86_64 i686)
url="https://github.com/kivikakk/$pkgname"
license=(BSD-2-Clause)
depends=(glibc # libc.so libm.so 
         libgcc libgcc_s.so
	 oniguruma) # libonig.so
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('74dfb6edda9b94b557685382162844ec9902cea3f10281585035c7a51d04fcfc')

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
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=' -ffat-lto-objects'
	export RUSTONIG_DYNAMIC_LIBONIG=1
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	local skipped=(
		# Pathological timeouts
		tests::pathological::pathological_description_lists
		tests::pathological::pathological_emphases
		tests::pathological::pathological_emphasis_mod_three_1
		tests::pathological::pathological_emphasis_mod_three_2
		tests::pathological::pathological_footnote_label_reconstruction
		tests::pathological::pathological_footnotes
		tests::pathological::pathological_header_ids
		tests::pathological::pathological_recursion
		tests::pathological::pathological_recursion_inline_footnotes
		tests::pathological::pathological_relaxed_autolink_url_dead_zone
		tests::pathological::pathological_relaxed_autolink_www_dead_zone
		tests::pathological::pathological_table_autocompleted_cells
		tests::pathological::pathological_table_columns_1
		tests::pathological::pathological_table_columns_2
	)
	cargo test --frozen --all-features -- ${skipped[@]/#/--skip }
}

package () {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
