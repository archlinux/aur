# Maintainer: otreblan <otreblain@gmail.com>
# Modified PKGBUILD from vulkan-html-docs

pkgname="vulkan-man-pages"
pkgver=1.2.148
pkgrel=1
pkgdesc="Vulkan man pages as manpages"
arch=("any")
url="https://github.com/KhronosGroup/Vulkan-Docs"
license=('custom')
makedepends=(
	"asciidoctor"
	"cmake"
	"dblatex"
	"ghostscript"
	"git"
	"nodejs"
	"npm"
	"python3"
	"source-highlight"
)
source=("$url/archive/v$pkgver.tar.gz" "manpage.patch")
sha256sums=(
	'6eb9f22f193308efa90d947b927c47583d2a6c0e133d1b4a1a0f97d94b8a670e'
	'6de188870cdd213f7184d34df69b65df811bb52932a0f604248dbb323bfd979b'
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
