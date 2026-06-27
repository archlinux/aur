# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=wrkflw
pkgver=0.8.0
pkgrel=1
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

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

_srcenv() {
	cd "$_archive"
	CFLAGS+=' -ffat-lto-objects'
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export OPENSSL_NO_VENDOR=true
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
