# Maintainer: otreblan <otreblain@gmail.com>
# Modified PKGBUILD from vulkan-html-docs

pkgname="vulkan-man-pages"
pkgver=1.3.261
pkgrel=1
pkgdesc="Vulkan man pages as manpages"
arch=("any")
url="https://github.com/KhronosGroup/Vulkan-Docs"
license=('custom')
makedepends=(
	"asciidoctor"
	"cmake"
	"ghostscript"
	"git"
	"nodejs"
	"npm"
	"python-pyparsing"
	"python3"
	"source-highlight"
)
source=("$url/archive/v$pkgver.tar.gz" "manpage.patch")
sha256sums=('ead8f6ed2e2b872010078ab623d4b7d7cad281e02b106ee99970046c8a4109f1'
            'b528ee22bf79e97ace34269711f17b9d15237246c40dc1f7504ab2d557534632')

prepare() {
	npm install escape-string-regexp@4.0.0
	npm install he
	cd "$srcdir"

	mv ${url##*/}-$pkgver $pkgname-$pkgver

	patch --strip=1 < ../manpage.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./makeAllExts html manhtmlpages styleguide registry
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/man/man3"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

	mv -v gen/out/man/html/* "$pkgdir/usr/share/man/man3"

	install -m644 config/copyright-ccby.adoc "$pkgdir/usr/share/licenses/$pkgname/copyright-ccby.adoc"
	install -m644 config/copyright-spec.adoc "$pkgdir/usr/share/licenses/$pkgname/copyright-spec.adoc"
}
