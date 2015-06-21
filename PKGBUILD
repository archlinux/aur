# Contributor: Orivej Desh <smpuj@bk.ru>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=latin-words
pkgver=1.97FC
pkgrel=4
pkgdesc="Latin-english-latin intelligent dictionary and latin text analyser"
arch=("i686" "x86_64")
url="http://users.erols.com/whitaker/words.htm"
license=('custom')
makedepends=('gcc-ada' 'unzip')
provides=("wordslatin")
conflicts=("wordslatin")
source=("http://archives.nd.edu/whitaker/wordsall.zip" "words.sh" "license.txt")
md5sums=('e70ae2112bb7c7c491c3ec7a57af779c' 'a8a9a0b6dd56aacaeefaa7e1bd8077c8'\
         '43cc5e098f51e02401d2a140cb8a6796')

build() {
	cd $srcdir
	unzip -quo wordsall || return 1
	gnatmake -O3 words || return 1
	gnatmake makedict && echo "g" | ./makedict || return 1
	gnatmake makestem && echo "g" | ./makestem || return 1
	gnatmake makeefil && ./makeefil || return 1
	gnatmake makeinfl && ./makeinfl || return 1
}
package() {
	cd $srcdir
	install -D words $pkgdir/usr/share/words-$pkgver/words || return 1
	install -m644 ADDONS.LAT DICTFILE.GEN EWDSFILE.GEN INDXFILE.GEN \
	  INFLECTS.SEC STEMFILE.GEN UNIQUES.LAT \
	  $pkgdir/usr/share/words-$pkgver/ || return 1
	install -Dm644 wordsdoc.htm \
	  $pkgdir/usr/share/doc/words-$pkgver/wordsdoc.htm || return 1
	install -D words.sh $pkgdir/usr/bin/words || return 1
	sed -s "s/PKGNAME/words/" -i $pkgdir/usr/bin/words || return 1
	sed -s "s/PKGVER/$pkgver/" -i $pkgdir/usr/bin/words || return 1
	install -Dm644 license.txt \
	  $pkgdir/usr/share/licenses/latin-words/LICENSE || return 1
}
