# Maintainer: otreblan <otreblain@gmail.com>
# Modified PKGBUILD from vulkan-html-docs

pkgname="vulkan-man-pages"
pkgver=1.2.179
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
	'0005b0b7b3019e82a73e95fafcb419f92c8187a527b55e337f0b0d25f0ae17e1'
	'ddf2bcf4da1bca508428e74aad51eefadc014f797cb28c8510b358f8c86dcaea'
)

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

	install -m644 config/copyright-ccby.txt $pkgdir/usr/share/licenses/$pkgname/copyright-ccby.txt
	install -m644 copyright-spec.txt $pkgdir/usr/share/licenses/$pkgname/copyright-spec.txt
}
