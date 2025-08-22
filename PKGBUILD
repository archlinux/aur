# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: pinks <aur at papepati dot page>

pkgname=xee
pkgver=0.1.6
pkgrel=1
pkgdesc='CLI frontent to XML Execution Engine, a modern XPath and XSLT processor'
arch=(x86_64)
url=https://github.com/Paligo/xee
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo
             git)
source=("git+$url.git#tag=xee-v$pkgver")
sha256sums=('916ea97376f4e50c58b0f334865305e3db19d766185f089a5b72f3457d08fcf8')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

_srcenv() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
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
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
}
