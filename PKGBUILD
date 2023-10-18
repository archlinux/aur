# Maintainer: otreblan <otreblain@gmail.com>
# Contributor: Bohdan Mart <mart.bogdan at gmail>
# Modified PKGBUILD from vulkan-html-docs

pkgname="vulkan-man-pages"
pkgver=1.3.268
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
sha256sums=('c0cf01f36ca9636079e6219188542fd48fce61f45d0b5e65b7a50368431b29c0'
            'd968e2324dca1ba429e5f5da4c7f8be64b3b7fe243f368dd1b940a2cf4de91cf')

prepare() {
	npm install escape-string-regexp@4.0.0
	npm install he
	cd "$srcdir"

	mv ${url##*/}-$pkgver $pkgname-$pkgver

	patch --strip=1 < ../manpage.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./makeAllExts -j html manhtmlpages styleguide registry
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/man/man3"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

	mv -v gen/out/man/html/* "$pkgdir/usr/share/man/man3"

	install -m644 config/copyright-ccby.adoc "$pkgdir/usr/share/licenses/$pkgname/copyright-ccby.adoc"
	install -m644 config/copyright-spec.adoc "$pkgdir/usr/share/licenses/$pkgname/copyright-spec.adoc"
}
