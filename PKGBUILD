# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=brioche
pkgver=0.1.5
pkgrel=1
pkgdesc='a package manager and build tool for building and running complex software projects'
arch=(x86_64)
url="https://$pkgname.dev"
_url="https://github.com/brioche-dev/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
options=(!lto)
_archive="$pkgname-$pkgver"
source=("$_url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('a6589432cf11bb8af42aa4eb48275ec6eabc65009f637c25dc21c01bc5929f44')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	local skipped=(
		test_eval_async
		test_eval_basic
		test_eval_brioche_glob
		test_eval_brioche_glob_submodule
		test_eval_brioche_include_directory
		test_eval_brioche_include_file
		test_eval_custom_export
		test_eval_import_dep
		test_eval_import_local
		test_eval_serialize_async
		test_script_ops_version
	)
	cargo test --frozen --all-features -- ${skipped[@]/#/--skip }
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
