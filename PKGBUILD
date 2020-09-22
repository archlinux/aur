# Maintainer: otreblan <otreblain@gmail.com>
# Modified PKGBUILD from vulkan-html-docs

pkgname="vulkan-man-pages"
pkgver=1.2.154
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
	"python3"
	"source-highlight"
)
source=("$url/archive/v$pkgver.tar.gz" "manpage.patch")
sha256sums=(
	'd0c9dae301c13f2d2f992056982864c4df2ab7e8b3d9dde7fb398e0520d1f574'
	'f867124881d2735ae2091f1071213f196590c9e6b6e6ce06bab70c6c965d8540'
)

prepare() {
	npm install escape-string-regexp
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

	install -m644 config/copyright-ccby.txt $pkgdir/usr/share/licenses/$pkgname/copyright-ccby.txt
	install -m644 copyright-spec.txt $pkgdir/usr/share/licenses/$pkgname/copyright-spec.txt
}
