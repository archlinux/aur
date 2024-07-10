# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=xet
pkgname=(git-xet xetcmd xetmnt)
pkgver=0.14.4
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
sha256sums=('0afd5a912e2beaf10429bf1f216c0a76db3dc385a05ec4d406d146bde7a230a4')

prepare() {
	cd "$_archive"
	# Upstream lockfile not synced
	pushd rust;   cargo update; popd
	pushd rust;   cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"; popd
	pushd gitxet; cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"; popd
	# pushd libxet; cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"; popd
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
	cd "$_archive"
	pushd rust; cargo build --frozen --release; popd
	pushd gitxet; cargo build --frozen --release; popd
	# pushd libxet; cargo build --frozen --release; popd
}

_package() {
	cd "$_archive/$1"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" ../LICENSE
}

package_git-xet() {
	_package gitxet
}

package_xetcmd() {
	_package rust
}

package_xetmnt() {
	depends+=(git-xet)
	_package gitxet
}
