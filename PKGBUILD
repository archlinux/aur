# Maintainer: araidameru <x>
# Contributor: otreblan <otreblain@gmail.com>
# Contributor: Bohdan Mart <mart.bogdan at gmail>
# Modified PKGBUILD from vulkan-html-docs

pkgname="vulkan-man-pages"
pkgver=1.4.309
pkgrel=5
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
sha256sums=('927988494d09d3227fc6f70c86ffbfc0bbd5776ca535fd9f1e2a3d30f5c1b1e7'
            '4e7201a5038cd88c03f48f3050702f3bcb1ca9acc974f5aa179a3b704d58b2fc')

prepare() {
	npm install escape-string-regexp@4.0.0
	npm install he
	cd "$srcdir"

	mv ${url##*/}-$pkgver $pkgname-$pkgver

	patch --strip=1 < ../manpage.patch

	cd "$srcdir/$pkgname-$pkgver"

	local _ESC="?\\\\u001b"
	local _NL="\"\\\\n\""

	sed -i "s/'<code>' + \(.*\) + '<\/code>'/ $_ESC + '\\\\#' + $_NL + $_ESC + \".IR \" + \1 + $_NL/" config/spec-macros/extension.rb
	sed -i "s/'<strong .*>' + \(.*\) + '<\/strong>'/ $_ESC + '\\\\#' + $_NL + $_ESC + \".B \" + \1 + $_NL/" config/spec-macros/extension.rb
	sed -i "s/Inline.new(.*html.*)/ $_ESC + '\\\\#' + $_NL + $_ESC + \".BR \" + target + ' (3)' + $_NL/" config/spec-macros/extension.rb
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

	find "$pkgdir/usr/share/man/man3" -name "*.3.gz" -exec gzip -d {} \+
	find "$pkgdir/usr/share/man/man3" -name "*.3" -exec sed -i 's/\(.\)\\#/\1\n\\#/' {} \+
	find "$pkgdir/usr/share/man/man3" -name "*.3" -exec sed -i 's/"C SPECIFICATION"/SYNOPSIS/' {} \+
	find "$pkgdir/usr/share/man/man3" -name "*.3" -exec gzip {} \+

	install -m644 config/copyright-ccby.adoc "$pkgdir/usr/share/licenses/$pkgname/copyright-ccby.adoc"
	install -m644 config/copyright-spec.adoc "$pkgdir/usr/share/licenses/$pkgname/copyright-spec.adoc"
}
