# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=brioche-git
_pkgname=${pkgname%-git}
pkgver=0.1.0.r0.g31f0e37
pkgrel=1
pkgdesc='a package manager and build tool for building and running complex software projects'
arch=(x86_64)
url="https://$_pkgname.dev"
_url="https://github.com/brioche-dev/$_pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo
             git)
provides=("$_pkgname=$pkgver")
conflicts=("$pkgname")
options=(!lto)
source=("git+$_url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_srcenv() {
	cd "$_pkgname"
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
	)
	cargo test --frozen --all-features -- ${skipped[@]/#/--skip }
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}
