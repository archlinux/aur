# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=wrkflw
pkgver=0.8.0
pkgrel=2
pkgdesc='validate and execute GitHub Actions workflows locally'
url="https://github.com/bahdotsh/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(gcc-libs
         glibc
         openssl libcrypto.so)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('79d63da0c40cfb884600b671830d63bb6cf143f1d8e65886e067a747491c23b4')

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
	CFLAGS+=' -fno-lto'
	export OPENSSL_NO_VENDOR=true
}

prepare() {
	_srcenv
	# Upstream lockfile is broken
	cargo update
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	local skipped=(
		# Possibly impure, reaching into system Git config?
		prefilter::prefilter_tests::non_strict_filter_allows_event_alone_with_warning_and_empty_change_set
		prefilter::prefilter_tests::skip_decision_returned_when_trigger_does_not_match
		prefilter::prefilter_tests::strict_filter_rejects_event_alone_without_diff_or_changed_files
		prefilter::prefilter_tests::strict_filter_rejects_pull_request_without_base_branch
	)
	cargo test --frozen --all-features -- ${skipped[@]/#/--skip }
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
