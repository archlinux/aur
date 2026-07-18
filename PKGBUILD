# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=tylax
pkgver=0.3.7
pkgrel=1
pkgdesc='A bi-directional converter between Typst and LaTeX'
arch=(x86_64)
url="https://github.com/scipenai/$pkgname"
license=(Apache-2.0)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('61a4211c4367f0e8163be3828d178cf26afc267407b065d76e46d150bdd74697')

_srcenv() {
	cd "$_archive"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release --all-features
}

check() {
	_srcenv
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/t2l"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
