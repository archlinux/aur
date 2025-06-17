# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: pinks <aur at papepati dot page>

pkgname=biome
pkgver=2.0.0
pkgrel=1
pkgdesc='Formatter, linter, and more for Javascript, Typescript, JSON, and CSS'
arch=(x86_64)
url=https://biomejs.dev
_url="https://github.com/biomejs/$pkgname"
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
replaces=(rome)
_archive="$pkgname--biomejs-biome-$pkgver"
source=("$_url/archive/@biomejs/biome@$pkgver/$_archive.tar.gz")
sha256sums=('76e8119637eac89caae6e592daae6a95c3fb162bbe061c3791a6509a21ffa8e2')

prepare() {
	cd "$_archive/crates/${pkgname}_cli"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
}

build() {
	_srcenv
	cargo build -p "${pkgname}_cli"  --frozen --release --all-features
}

check() {
	_srcenv
	local skipped=(
		cases::diagnostics::max_diagnostics_verbose
		commands::explain::explain_help
		commands::lsp_proxy::lsp_proxy_help
	)
	cargo test -p "${pkgname}_cli" --frozen --all-features -- \
		${skipped[@]/#/--skip }
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-*
}
