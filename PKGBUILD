# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=docspec
pkgver=1.21.11
pkgrel=2
pkgdesc='Rust implementation of DocSpec, a streaming document conversion library'
arch=(x86_64)
url="https://github.com/$pkgname/$pkgname"
license=(MIT)
depends=(glibc # libc.so libm.so
         libgcc)
makedepends=(cargo
             git)
checkdepends=(pandoc-cli
              tika)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('d1033e14860cb9eeb2bd681f78d676d27714cf39db23ff56d043a21cd59c61a6')

_srcenv() {
	cd "$pkgname"
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
	CFLAGS+=' -fno-lto'
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
		tests::sample_docx_lifts_list_from_requirements_cell
		tests::sample_docx_table_cell_with_lift_is_empty
	)
	cargo test --frozen --release -- ${skipped[@]/#/--skip }
}

package() {
	depends+=(libgcc_s.so)
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
