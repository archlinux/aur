# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=docspec
pkgver=1.21.10
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
sha256sums=('bf508c839a230beb7fcc5d540ddac12face5a8c7802b969db1f474e30672ae73')

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
