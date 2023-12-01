# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=xet
pkgname=(git-xet xetcmd xetmnt)
pkgver=0.12.5
pkgrel=2
pkgdesc='CLI tools for working with XetHub'
arch=(x86_64)
url=https://xethub.com
license=(BSD)
depends=(gcc-libs
         glibc
         libz.so
         zlib)
makedepends=(cargo
             openssl)
_archive="xet-core-$pkgver"
options=(!lto)
source=("https://github.com/xetdata/xet-core/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('4f6acdb252e1bccf8a1dd00d0b045ad613f76caa64190cf8793d13e67b53be16')

prepare() {
	cd "$_archive/rust"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
