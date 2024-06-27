pkgname=lsp-ai
pkgver=0.3.0
pkgrel=1
pkgdesc='A language server that performs completion using large language models (LLMs)'
arch=('x86_64')
license=('MIT')
url='https://github.com/SilasMarvin/lsp-ai'
source=("git+$url.git#tag=v0.3.0")
makedepends=(base-devel cargo)
sha1sums=('6bc8bedfa1f10daf7e1fd1bc2f7b015be3752773')

options=(!lto)

pkgver() {
	cd lsp-ai
	git describe --tags --long | sed 's/^v//; s/-0-[[:alnum:]]*$//; s/-/+/g'
}

prepare() {
	cd lsp-ai
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd lsp-ai
	cargo build --frozen --release --target-dir target
}

package() {
	cd lsp-ai
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

	install -d "$pkgdir/usr/share/doc/$pkgname"
	cp -rt "$pkgdir/usr/share/doc/$pkgname" examples

}
