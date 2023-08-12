# Maintainer: otreblan <otreblain@gmail.com>
# Modified PKGBUILD from vulkan-html-docs

pkgname="vulkan-man-pages"
pkgver=1.3.259
pkgrel=2
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
sha256sums=('44f248cc8b8ed96d0c9afdece57bcf70e2c1262bc90bcffc3a025e1f2451906b'
            '08d4ffa3fa1143baefdcd5770dcc20a1f23e0a4ff5ad8056159ecaa969475915')

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

	install -m644 config/copyright-ccby.adoc $pkgdir/usr/share/licenses/$pkgname/copyright-ccby.adoc
	install -m644 config/copyright-spec.adoc $pkgdir/usr/share/licenses/$pkgname/copyright-spec.adoc
}
