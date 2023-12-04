# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=typst-lsp
pkgver=0.12.0
pkgrel=1
pkgdesc='Language server for Typst'
arch=(i686 x86_64)
url="https://github.com/nvarner/$pkgname"
license=(Apache MIT)
depends=(gcc-libs
         glibc
         libcurl.so
         libcrypto.so)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('45654fccf76ffb32e8e3f6e1deb4cddc9b92269e3db72760667e5f728e849556')

_features='remote-packages,native-tls,fontconfig'

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
	cargo build --frozen --release --no-default-features --features "$_features"
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen  --no-default-features --features "$_features"
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/typst-lsp/" "LICENSE-MIT.txt"
}
