# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=docspec
pkgver=1.21.9
pkgrel=1
pkgdesc='Rust implementation of DocSpec, a streaming document conversion library'
arch=(x86_64)
url="https://github.com/$pkgname/$pkgname"
license=(MIT)
depends=(glibc # libc.so libm.so
         libgcc)
makedepends=(cargo
             git)
checkdepends=(pandoc-cli)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('b5757f8f0d21a129e389b09c3f710c5d29792a9aa27b0ef0818faa6164a5b420')

_srcenv() {
	cd "$pkgname"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -ffat-lto-objects'
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
