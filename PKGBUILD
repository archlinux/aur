# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: pinks <aur at papepati dot page>

pkgname=biome
pkgver=1.5.2
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
_archive="$pkgname-cli-v$pkgver"
source=("$_url/archive/cli/v$pkgver/$_archive.tar.gz")
sha256sums=('0fcadbf7454285a2f6380d33dddc04f86b5756431570c15d9292989037bf4910')

prepare() {
	cd "$_archive/crates/${pkgname}_cli"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build -p "${pkgname}_cli"  --frozen --release --all-features
}

check() {
	_srcenv
	cargo test -p "${pkgname}_cli" --frozen --all-features -- \
		--skip commands::explain::explain_help
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-*
}
