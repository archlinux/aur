# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=xet
pkgname=(git-xet xetcmd xetmnt)
pkgver=0.13.1
pkgrel=1
pkgdesc='CLI tools for working with XetHub'
arch=(x86_64)
url=https://xethub.com
_url='https://github.com/xetdata/xet-core'
license=(BSD)
depends=(gcc-libs
         glibc
         openssl
         zlib libz.so)
makedepends=(cargo
             protobuf
             openssl)
_archive="xet-core-$pkgver"
options=(!lto)
source=("$_url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('9da4ffe0ff1e3659508eb5860f86b41f23e74ef5aee0a9fe8bae6aa3e04ddb47')

prepare() {
	cd "$_archive/rust"
	cargo update
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_archive/rust"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
	cargo build --frozen --release --all-features
}

_package() {
	cd "$_archive/rust"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
}

package_git-xet() {
	_package
}

package_xetcmd() {
	_package
}

package_xetmnt() {
	depends+=(git-xet)
	_package
}
