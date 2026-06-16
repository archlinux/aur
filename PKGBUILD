# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=grit-cli
_pkgname=${pkgname%-cli}
pkgver=0.4.9
pkgrel=1
pkgdesc='LLM coded port of git to Rust'
url='https://grit-scm.com'
_url="https://github.com/gitbutlerapp/$_pkgname"
arch=(x86_64)
license=(GPL-2.0-only MIT)
depends=(glibc # libc.so ld-linux-x86-64.so
         libgcc libgcc_s.so)
makedepends=(cargo)
checkdepends=(git)
options=(!lto)
conflicts=($_pkgname)
_archive="$_pkgname-$pkgver"
source=("$_archive.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha256sums=('01290722b5a1536ac02430f53bb7c83ec7f577bc7aabdb51fe46551f127e235d')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	local skipped=(
		ignore::gitignore_glob_tests::dir_star_extension_matches_nested_path
		ignore::gitignore_glob_tests::nested_dir_star_extension
		sha256_clone_fetch_push_roundtrip
		sha256_fast_import_creates_sha256_objects
		sha256_reftable_refs_roundtrip
	)
	cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
