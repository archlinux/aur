pkgname=lsp-ai
_tag=v0.5.1
pkgver=0.5.1
pkgrel=1
pkgdesc='A language server that performs completion using large language models (LLMs)'
arch=('x86_64')
license=('MIT')
url='https://github.com/SilasMarvin/lsp-ai'
source=("$pkgname::git+$url.git#tag=$_tag")
depends=(gcc-libs)
makedepends=(base-devel cargo git)
sha1sums=('e72421d92bd94e259e32a9fd29c43a5a2625b46d')

pkgver() {
	cd $pkgname

	git describe --tags --long | sed 's/^v//; s/-0-[[:alnum:]]*$//; s/-/+/g'
}

prepare() {
	cd $pkgname

	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $pkgname

	export CFLAGS+=' -ffat-lto-objects'
	export CXXFLAGS+=' -ffat-lto-objects'
	export RUSTFLAGS+=" --remap-path-prefix $PWD=/"

	cargo build --frozen --release --target-dir target
}

package() {
	cd $pkgname

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

	install -d "$pkgdir/usr/share/doc/$pkgname"
	cp -rt "$pkgdir/usr/share/doc/$pkgname" examples
}
