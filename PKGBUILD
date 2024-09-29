pkgname=lsp-ai
_fragment=tag=v0.7.1
pkgver=0.7.1
pkgrel=1
pkgdesc='A language server that performs completion using large language models (LLMs)'
arch=('x86_64')
license=('MIT')
url='https://github.com/SilasMarvin/lsp-ai'
source=("$pkgname::git+$url.git#$_fragment")
depends=(gcc-libs)
makedepends=(cargo git)
sha1sums=('ca3e917f2064ebf92a26cc52cf6cc69efbef46ec')

pkgver() {
	cd $pkgname

	git describe --tags | sed 's/^v//; s/-/+/g'
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
