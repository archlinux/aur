# Maintainer: OctopusET

pkgname=hunspell-ko
pkgver=0.7.92
pkgrel=2
pkgdesc="Korean dictionary for hunspell"
arch=('any')
url='https://github.com/spellcheck-ko/hunspell-dict-ko'
license=('GPL3')
depends=('hunspell>=1.3.1')
makedepends=('python-yaml')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/spellcheck-ko/hunspell-dict-ko/archive/${pkgver}.tar.gz")
sha1sums=('41085dac1529224d96bfef13fa7fc836aeee5bda')
build() {
	cd "$srcdir/hunspell-dict-ko-$pkgver"
	make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr
}

package() {
	cd "$srcdir/hunspell-dict-ko-$pkgver" 
	install -dm755 "${pkgdir}/usr/share/hunspell"
	install -m644 ko.dic "${pkgdir}"/usr/share/hunspell
	install -m644 ko.aff "${pkgdir}"/usr/share/hunspell
	pushd "$pkgdir"/usr/share/hunspell
	for file in ko.*; do
		ln -s ko_KR."${file#*.}"
	done
	popd

# symlinks
	install -dm755 "${pkgdir}"/usr/share/myspell/dicts
	pushd "$pkgdir"/usr/share/myspell/dicts
	for file in "${pkgdir}"/usr/share/hunspell/*; do
		ln -sv /usr/share/hunspell/$(basename $file) .
	done
	popd

# licenses
	install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
