# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=xet
pkgname=(git-xet xetcmd xetmnt)
pkgver=0.12.8
pkgrel=1
pkgdesc='CLI tools for working with XetHub'
arch=(x86_64)
url=https://xethub.com
_url='https://github.com/xetdata/xet-core'
license=(BSD)
depends=(gcc-libs
         glibc
         libz.so
         zlib)
makedepends=(cargo
             protobuf
             openssl)
_archive="xet-core-$pkgver"
options=(!lto)
source=("$_url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('4a132ce3b9b7775a560c88f4781b735d51239668cbe436f1850f74b2a3791d4a')

prepare() {
	cd "$_archive/rust"
	cargo update
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	sed -r -i -e '107s/mut //' gitxetcore/src/xetmnt/watch/metadata/filesystem.rs
}

build() {
	cd "$_archive/rust"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

_package_bin() {
	cd "$_archive/rust"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
}

package_git-xet() {
	_package_bin
}

package_xetcmd() {
	_package_bin
}

package_xetmnt() {
	depends+=(git-xet)
	_package_bin
}
