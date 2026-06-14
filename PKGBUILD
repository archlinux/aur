# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=grit-cli
_pkgname=${pkgname%-cli}
pkgver=0.4.7
pkgrel=1
pkgdesc='LLM coded port of git to Rust'
url='https://grit-scm.com'
_url="https://github.com/gitbutlerapp/$_pkgname"
arch=(x86_64)
license=(MIT)
depends=( gcc-libs
         glibc)
makedepends=(cargo)
# checkdepends=(git)
options=(!lto)
conflicts=($_pkgname)
_archive="$_pkgname-$pkgver"
source=("$_archive.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha256sums=('2064ce95e3e824f632ac210dc8f4dfc0315eeadf99f8e77134515b30c31c868f')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target host-tuple
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	local skipped=()
	cargo test --frozen -- ${skipped[@]/#/--skip }
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
