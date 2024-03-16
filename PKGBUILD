# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=typst-lsp
pkgver=0.13.0
pkgrel=1
pkgdesc='Language server for Typst'
arch=(i686 x86_64)
url="https://github.com/nvarner/$pkgname"
license=(Apache MIT)
depends=(gcc-libs
         glibc
         curl libcurl.so
         openssl libcrypto.so)
makedepends=(cargo)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('860d56653b719402736b00ac9bc09e5e418dea2577cead30644252e85ab5d1a1')

_features='remote-packages,native-tls,fontconfig'

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	_srcenv
	CFLAGS+=' -ffat-lto-objects'
	cargo build --frozen --release --no-default-features --features "$_features"
}

check() {
	_srcenv
	cargo test --frozen --no-default-features --features "$_features"
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/typst-lsp/" LICENSE-MIT.txt
}
