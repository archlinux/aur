# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot com>

pkgname=hunspell-ko
pkgver=0.7.92
pkgrel=4
pkgdesc="Korean hunspell dictionary"
arch=('any')
url='https://github.com/spellcheck-ko/hunspell-dict-ko'
license=('GPL3')
#makedepends=('qt5-webengine')
optdepends=('hunspell: the spell checking libraries and apps')
source=(https://github.com/spellcheck-ko/hunspell-dict-ko/releases/download/${pkgver}/ko-aff-dic-${pkgver}.zip)
sha512sums=('300e574c7221841801f0d4b114abaa3b15196b69cb25f98ed784c820d125bd60e6fe6ca6cc76dca07de9382e957acd4bc337fa87b84f809b13f703ebe47baa45')

package() {
	cd "$srcdir/ko-aff-dic-$pkgver" 
	install -dm755 "${pkgdir}/usr/share/hunspell"
	install -m644 ko.dic "${pkgdir}"/usr/share/hunspell
	install -m644 ko.aff "${pkgdir}"/usr/share/hunspell

	pushd "$pkgdir/usr/share/hunspell/"
		ko_KR_aliases="ko_KR"
		for lang in $ko_KR_aliases; do
			ln -s ko.aff $lang.aff
			ln -s ko.dic $lang.dic
		done
	popd

	# Install webengine dictionaries (not able to convert)
#	install -d "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/
#	for _file in "$pkgdir"/usr/share/hunspell/*.dic; do
#		_filename="$(basename "$_file")"
#		qwebengine_convert_dict "$_file" "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/${_filename/\.dic/\.bdic}
#	done
	
	# myspell symlinks
	install -dm755 "${pkgdir}"/usr/share/myspell/dicts
	pushd "$pkgdir"/usr/share/myspell/dicts
		for dict in "${pkgdir}"/usr/share/hunspell/*; do
			ln -sv /usr/share/hunspell/$(basename $dict) .
		done
	popd

	# licenses
	install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
	#install -Dm644 LICENSE.GPL-3 $pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL-3
}
